#!/bin/bash

logic() {
  local menu="$1"
  case "$menu" in
  "1")
    sort_response_code
    ;;
  "2")
    uniq_ip
    ;;
  "3")
    error_code
    ;;
  "4")
    uniq_ip_for_among_error
    ;;
  esac
}

sort_response_code() {
  sort -k9,9n nginx_log_*.log | column -t
}

uniq_ip() {
  awk '{print $1}' nginx_log_*.log | sort | uniq
}

error_code() {
  awk '$9 >= 400' nginx_log_*.log | column -t
}

uniq_ip_for_among_error() {
  awk '$9 >= 400' nginx_log_*.log | awk '{print $1}' | sort | uniq
}
