#! /usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/wallpaper"

cd "$WALLPAPER_DIR" || exit

OPTIONS=$(find . -maxdepth 2 -type f)
RESULT=$(echo "$OPTIONS" | dmenu -i -p "Select wallpaper: ")

feh --no-fehbg --bg-scale "$WALLPAPER_DIR/$RESULT"
