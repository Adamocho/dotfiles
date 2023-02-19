#!/bin/bash

OPTIONS=$'Search\nRandom\nExit\nHelp'
RESULT=$(echo "$OPTIONS" | dmenu -i -p "Manpages options: ")

case "$RESULT" in
    Search)
        RES=$(man -k . | cut -d ' ' -f 1,2 | tr -d ' ' | dmenu -i -l 10 -p "Search manpages: ")
        [ -n "$RES" ] && x-terminal-emulator -e man "$RES" > /dev/null
        ;;
    Random)
        SECTION=$(find /usr/share/man/* -maxdepth 0 -type d -name "man*" -printf "%f\n" | dmenu -i -p "Select section: ")
        [ -n "$SECTION" ] && RES=$(find /usr/share/man/"$SECTION"/* -type f -printf "%f\n" | sed 's/\(.*\)\..*/\1/' | shuf | head -1)
        [ -n "$RES" ] && x-terminal-emulator -e man "$RES" > /dev/null
        ;;
	Help)
		x-terminal-emulator -e man man > /dev/null
		;;
    *)
        exit;;
esac
