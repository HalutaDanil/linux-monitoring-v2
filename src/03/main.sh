#!/bin/bash

source ./validate.sh
source ./remove.sh

menu="$1"
check_input "$menu" || exit 1

choice "$menu"
