#!/bin/bash

source ./validate.sh

choice() {
  local menu="$1"
  case "$menu" in
  "1")
    remove_log_file
    ;;
  "2")
    remove_time
    ;;
  "3")
    remove_mask
    ;;
  esac
}

remove_log_file() {
  local log_file

  log_file=$(find / -type f 2>/dev/null | grep -E "([0-9]{2}_){5}[0-9]{2}\.log$")
  mapfile -t arr_log_file <<<"$log_file"

  for ((i = 0; i < ${#arr_log_file[@]}; i++)); do
    [[ -f "${arr_log_file[i]}" ]] || continue

    mapfile -t arr_data_file < <(awk '{print $2}' "${arr_log_file[i]}")

    rm "${arr_log_file[i]}"

    for ((j = 5; j < ${#arr_data_file[@]}; j++)); do
      local target="${arr_data_file[j]}"

      if [[ -n "$target" && -d "$target" ]]; then
        rm -rf "$target"
      fi
    done
  done
}

remove_time() {
  read -p "Укажите дату и время создания в формате: 'YYYY-MM-DD HH:MM' 'YYYY-MM-DD HH:MM' " start_date start_time end_date end_time
  check_time "$start_date $start_time" || return 1
  check_time "$end_date $end_time" || return 1

  find / -path /proc -prune -o -path /sys -prune -o -path /dev -prune -o -path /run -prune -o \
    -depth -type f -newermt "$start_date $start_time" ! -newermt "$end_date $end_time" -delete 2>/dev/null

  find / -path /proc -prune -o -path /sys -prune -o -path /dev -prune -o -path /run -prune -o \
    -depth -type d -empty -delete 2>/dev/null
}

remove_mask() {
  find / -depth -regextype posix-extended -type d -regex '.*/[A-Za-z]+_[0-9]{6}$' -exec rm -rf {} + 2>/dev/null
}
