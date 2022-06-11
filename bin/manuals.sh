#!/bin/sh

OPTIONS='Search\nRandom\nExit'

RESULT=$(echo "$OPTIONS" | dmenu -i -p "Manpages options: ")

case "$RESULT" in
    Search)
        man -k . | cut -d ' ' -f 1,2 | tr -d ' ' | dmenu -i -l 10 -p "Search manpages: " | xargs x-terminal-emulator -e man > /dev/null
        ;;
    Random)
        SECTION=$(find /usr/share/man/* -maxdepth 0 -type d -name "man*" -printf "%f\n" | dmenu -i -p "Select section: ")
        [ -n "$SECTION" ] && \
        find /usr/share/man/"$SECTION"/* -type f -printf "%f\n" | sed 's/\(.*\)\..*/\1/' | shuf | head -1 | xargs x-terminal-emulator -e man > /dev/null
        ;;
    *)
        exit;;
esac