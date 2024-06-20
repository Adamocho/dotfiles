#!/usr/bin/env bash

# Startup script

# Wallpaper
wbg ~/.config/river/thewall.jpg &

# Network applet
nm-applet --indicator &

# Bar
waybar &

# Notification deamnon
dunst
