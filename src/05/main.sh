#!/bin/bash

source ./sort.sh
source ./validate.sh

check_input "$1" || exit 1

logic "$1"
