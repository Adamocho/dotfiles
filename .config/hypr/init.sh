#!/usr/bin/env bash

# Startup hyprland script

# Wallpaper
wbg ~/.config/hypr/gothrones.jpeg &

# Network applet
nm-applet --indicator &

# Bar
waybar &

# Notification deamnon
dunst

