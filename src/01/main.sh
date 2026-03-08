#!/bin/bash

source ./validate.sh
source ./touch.sh

path="${1%/}"
check_dir "$path" || exit 1

count_subfolder="$2"
check_count "$count_subfolder" || exit 1

let_folder="$3"
check_let_folder "$let_folder" || exit 1

count_file="$4"
check_count "$count_file" || exit 1

let_file="$5"
check_let_folder "${let_file%.*}" || exit 1
check_extension "${let_file#*.}" || exit 1

size_file="$6"
check_size "${size_file%kb*}" || exit 1

log_file="$(date +"%d_%m_%y_%H_%M_%S").log"
touch "$log_file"
touch_file_and_folder "$path" "$count_subfolder" "$let_folder" "$count_file" "${let_file%.*}" "${let_file#*.}" "${size_file%kb*}K" >>"$log_file" || exit 1
