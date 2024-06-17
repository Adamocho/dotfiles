#! /usr/bin/env bash

[ 0 != "$(id -u)" ] && { printf "This script must be run as root!\n"; exit; }

SCRIPT_PATH=$(dirname "$0")
MAN_PATH="${SCRIPT_PATH}/../manpages"
MAN_DIRS=$( find "${MAN_PATH}"/* -type d -not -empty -printf "%f " | xargs )
THE_MAN_DIR="/usr/share/man"
REPLY="n"

for dir in $MAN_DIRS
do
    MANUALS=$( find "${MAN_PATH}/${dir}" -type f -printf "%p " | xargs )

    [ "${REPLY}" != Y ] && {

        read -r -p "Install manpages from /manpages/${dir}? [Y(all)/y/n*/N(all)] "

        [ "${REPLY}" = y ] || [ "${REPLY}" = Y ] && {
            for man in $MANUALS
            do
                cp -uiv "${man}" "${THE_MAN_DIR}/${dir}"
            done
        } || {
            [ "${REPLY}" = N ] && { printf "Exiting...\n"; exit 0; }
            printf "\033[93mNOTE\033[00m: directory omitted\n"
        }
    } || { 
        for man in $MANUALS
        do
            cp -uiv "${man}" "${THE_MAN_DIR}/${dir}"
        done
    }
done