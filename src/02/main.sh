#!/bin/bash

source ./validate.sh
source ./touch.sh

SECONDS=0

start_work=$(date +"%H:%M:%S")

path="$(pwd)"
check_dir "$path" || exit 1

let_folder="$1"
check_let_folder "$let_folder" || exit 1

let_file="$2"
check_let_folder "${let_file%.*}" || exit 1
check_extension "${let_file#*.}" || exit 1

size_file="$3"
check_size "${size_file%Mb*}" || exit 1

log_file="$(date +"%d_%m_%y_%H_%M_%S").log"
touch "$log_file"

touch_file_and_folder "$path" "$let_folder" "${let_file%.*}" "${let_file#*.}" "${size_file%Mb*}M" >>"$log_file" || exit 1

end_work=$(date +"%H:%M:%S")

printf "script start time: %s\nscript end time: %s\nfull work time in second: %s\n\n%s" "$start_work" "$end_work" "$SECONDS" "$(cat "$log_file")" >"$log_file"
