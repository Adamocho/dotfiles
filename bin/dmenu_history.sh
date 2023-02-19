#!/bin/bash

result=$( dmenu -i -l 26 -p "History command to copy: " < "${HOME}/.zsh_history" )

[[ -z "${result}" ]] && exit 0

echo "${result}" | xclip -selection clipboard && printf "Copied \n%s\n to clipboard" "${result}"
