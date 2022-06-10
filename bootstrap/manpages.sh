#!/bin/sh

[ 0 != "$(id -u)" ] && echo "This script must be run as root" && exit

SCRIPT_PATH=$(dirname "$0")
MAN_PATH="$SCRIPT_PATH/../manpages"
MAN_DIRS=$( find "$MAN_PATH"/* -type d -not -empty -printf "%f " | xargs )

for dir in $MAN_DIRS
do
    read -p "Do you want to install manuals from /manpages/$dir? [Y/n] " ANSWER

    [ "$ANSWER" = y ] || [ -z "$ANSWER" ] && {
        MANUALS=$( find "$MAN_PATH/$dir" -type f -printf "%p " | xargs )

        for man in $MANUALS
        do
            cp -ui "$man" /usr/share/man/"$dir" && {
                printf "\033[92mDONE\033[00m: manuals added\n"
            } || {
                printf "\033[91mERROR\033[00m: installation failed\n"
            }
        done
    } || {
        printf "\033[93mNOTE\033[00m: directory omitted\n"
    }
done