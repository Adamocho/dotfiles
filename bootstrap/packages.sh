#!/bin/sh

SCRIPT_PATH=$(dirname "$0")
PACKAGES_PATH="$SCRIPT_PATH/../software/packages"
PACKAGES_FILES=$( ls "$PACKAGES_PATH" | xargs )

printf "" >  ~/.config/packages_list.txt

for file in $PACKAGES_FILES
do
    read -p "Do you want to iterate through $file? [Y/n] " ANSWER

    [ "$ANSWER" = y ] || [ -z "$ANSWER" ] && {
        PACKAGES=$(grep -E "^[a-zA-Z0-9_\-]+" "$PACKAGES_PATH/$file")

        for p in $PACKAGES
        do
            read -p "Install $p? [Y/n] " ANSWER

            [ "$ANSWER" = y ] || [ -z "$ANSWER" ] && {
                printf "%s\n" "$p" >> ~/.config/packages_list.txt
                printf "\033[92mDONE\033[00m: package added\n"
            } || {
                printf "\033[93mNOTE\033[00m: package omitted\n"
            }
        done
    }
done