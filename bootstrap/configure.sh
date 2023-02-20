#!/bin/sh

SCRIPT_PATH=$(dirname "$0")
MODULES=$( ls "${SCRIPT_PATH}/../etc" | xargs )

for MODULE in $MODULES
do
    read -p "Do you want to install ${MODULE}? [Y/n] "

    [ "${REPLY}" = y ] || [ -z "${REPLY}" ] && {
        cp -ufr "${SCRIPT_PATH}/../etc/${MODULE}" "~/.config" && {
            printf "\033[92mDONE\033[00m: config installed\n"
        } || {
            printf "\033[91mERROR\033[00m: installation failed\n"
        }
    } || {
        printf "\033[93mNOTE\033[00m: config omitted\n"
    }
done