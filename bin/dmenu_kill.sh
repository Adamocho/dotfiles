#!/bin/bash

result=$( ps -e -o comm= | dmenu -i -l 20 -p "Process to kill: " )

[[ -z "${result}" ]] && exit 0

killall "${result}" && echo "Killed all: ${result}"
