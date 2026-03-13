#!/bin/bash

build_log() {
  for ((i = 0; i < 5; i++)); do
    log_count="$((RANDOM % 1000 + 100))"
    current_timestamp=$(date -d "2026-$((RANDOM % 12 + 1))-$((RANDOM % 28 + 1)) 00:00:00" +%s)
    log_file="nginx_log_$((i + 1)).log"
    touch "$log_file"
    for ((j = 0; j < log_count; j++)); do
      current_timestamp=$((current_timestamp + (RANDOM % 60 + 1)))
      date_str=$(date -d "@$current_timestamp" "+%d/%b/%Y:%H:%M:%S +0000")
      printf '%s - - [%s] "%s %s HTTP/1.1" %s %s "-" "%s"\n' "$(generate_ip)" \
        "$date_str" "$(generate_method)" "$(generate_url)" "$(generate_response_code)" "$((RANDOM % 5000 + 100))" "$(generate_agent)" >>"$log_file"
    done
  done
}

generate_ip() {
  printf "%s.%s.%s.%s" "$((RANDOM % 256 + 1))" "$((RANDOM % 256))" "$((RANDOM % 256))" "$((RANDOM % 256))"
}

generate_response_code() {
  local codes=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")

  printf "%s" "${codes[$((RANDOM % ${#codes[@]}))]}"
}

generate_method() {
  local methods=("GET" "POST" "PUT" "PATCH" "DELETE")

  printf "%s" "${methods[$((RANDOM % ${#methods[@]}))]}"
}

generate_agent() {
  local agents=("Mozilla" "Google" "Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")

  printf "%s" "${agents[$((RANDOM % ${#agents[@]}))]}"
}

generate_url() {
  local urls=("aemonhulik/api" "aemonhulik/calculate" "aemonhulik/profile" "aemonhulik/chat" "aemonhulik/page" "aemonhulik/todolist" "aemonhulik/blacklist" "aemonhulik/shop")

  printf "%s" "${urls[$((RANDOM % ${#urls[@]}))]}"
}
