#!/bin/bash

# If it works without sleep - great
# sleep 0.5 && ~/.fehbg &
~/.fehbg &

# Statusbar loop
while true; do
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m    # Update time every minute
done &
