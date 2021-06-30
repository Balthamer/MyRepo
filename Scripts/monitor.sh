#!/bin/bash

monitor=$(echo -e "Mirror\nExtend"  | rofi -dmenu -p "What monitor setup do you want?")
if [[ $monitor == "Mirror" ]]; then
    xrandr --output HDMI-1 --same-as HDMI-2
elif [[ $monitor == "Extend" ]]; then
    xrandr --output HDMI-1 --left-of HDMI-2
fi
