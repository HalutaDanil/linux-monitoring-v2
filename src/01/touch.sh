#!/bin/bash

source ./validate.sh

generate_name() {
  local letters="$1"
  local n=${#letters}
  local count=$(($2 + 4))
  local target=$((RANDOM % 5 + count))
  ((target < n)) && target=$n

  local counts=()
  for ((i = 0; i < n; i++)); do counts[i]=1; done

  for ((extra = target - n; extra > 0; extra--)); do
    ((counts[RANDOM % n]++))
  done

  local name=""
  for ((i = 0; i < n; i++)); do
    name+=$(printf "%${counts[i]}s" | tr ' ' "${letters:i:1}")
  done

  echo "${name}_$(date +%d%m%y)"
}

touch_file_and_folder() {
  local path="$1"
  local count_subfolder="$2"
  local letters_folder="$3"
  local count_file="$4"
  local letters_file="$5"
  local extension="$6"
  local size_file="$7"

  printf "%-100s %-10s %-6s\n" "PATH" "DATE" "SIZE"

  for ((i = 0; i < count_subfolder; i++)); do
    check_avail_size || return 1
    folder_name=$(generate_name "$letters_folder" "$i")
    while [[ -e "$path/$folder_name" ]]; do
      folder_name=$(generate_name "$letters_folder" "$i")
    done
    mkdir "$path/$folder_name"

    printf "| %-98s %-10s\n" "$path/$folder_name/" "$(date +%d.%m.%y)"

    for ((j = 0; j < count_file; j++)); do
      check_avail_size || return 1
      file_name=$(generate_name "$letters_file" "$j")."$extension"
      while [[ -e "$path/$folder_name/$file_name" ]]; do
        file_name=$(generate_name "$letters_file" "$j")."$extension"
      done
      truncate -s "$size_file" "$path/$folder_name/$file_name"

      printf "|-- %-96s %-10s   %-6s\n" "$path/$folder_name/$file_name" "$(date +%d.%m.%y)" ""$size_file"b"
    done
  done
}
