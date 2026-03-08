#!/bin/bash

check_avail_size() {
  local avail_size
  avail_size=$(df / | awk 'NR==2 {print $4}')

  if [[ "$avail_size" -le 1048576 ]]; then
    printf "Root size less or equal than 1G" >&2
    return 1
  fi
}

check_dir() {
  local path="$1"
  if [[ "$path" != /* ]]; then
    printf "Путь должен быть абсолютным!\n" >&2
    return 1
  elif [[ ! -d "$path" ]]; then
    printf "Такой директории не существует\n" >&2
    return 1
  fi
}

check_count() {
  local count="$1"
  if [[ "$count" == 0* ]]; then
    printf "Значение в количества должно быть больше нуля и не иметь незначащих нулей!\n" >&2
    return 1
  elif [[ ! "$count" =~ ^[0-9]+$ ]]; then
    printf "Значение в количества должно состоять только из цифр\n" >&2
    return 1
  fi
}

check_let_folder() {
  local let="$(echo "$1" | tr a-z A-Z)"
  if [[ ! "$let" =~ ^[A-Z]+$ ]]; then
    printf "Значение в последовательности букв для имени должно состоять только из букв\n" >&2
    return 1
  elif [[ ${#let} -gt 7 ]]; then
    printf "Значение в последовательности букв для имени должно состоять из не более 7 букв\n" >&2
    return 1
  fi
}

check_extension() {
  local extension="$(echo "$1" | tr a-z A-Z)"
  if [[ ! "$extension" =~ ^[A-Z]+$ ]]; then
    printf "Значение в последовательности букв для расширения должно состоять только из букв\n" >&2
    return 1
  elif [[ ${#extension} -gt 3 ]]; then
    printf "Значение в последовательности букв для расширения должно состоять из не более 3 букв\n" >&2
    return 1
  fi
}

check_size() {
  local size="$1"
  if [[ ! "$size" =~ ^[0-9]+$ ]]; then
    printf "Значение в размере должно состоять только из цифр и букв kb, обозначающих килобайты\n" >&2
    return 1
  elif [[ $size -gt 100 ]]; then
    printf "Значение в размере должно быть не более, чем 100 килобайт\n" >&2
    return 1
  fi
}
