#!/bin/sh

SCRIPT_PATH=$(dirname "$0")
SCRIPTS=$( find "$SCRIPT_PATH"/../bin/* -printf "%f " | xargs )

for SCRIPT in $SCRIPTS
do
    read -p "Do you want to install $SCRIPT? [Y/n] " ANSWER

    [ "$ANSWER" = y ] || [ -z "$ANSWER" ] && {
        cp -u "$SCRIPT_PATH/../bin/$SCRIPT" ~/.local/bin && {
            printf "\033[92mDONE\033[00m: script installed\n"
        } || {
            printf "\033[91mERROR\033[00m: installation failed\n"
        }
    } || {
        printf "\033[93mNOTE\033[00m: script omitted\n"
    }
done