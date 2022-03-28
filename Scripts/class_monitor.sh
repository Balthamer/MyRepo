#!/bin/bash

xset s off -dpms
xrandr --output HDMI-1 --mode 1920x1080
monitor=$(echo -e "1. Mirror\n2. Extend" | rofi -dmenu -p "What monitor setting do you want" | cut -d '.' -f 1)
[[ $monitor == "1" ]] && xrandr --output HDMI-1 --same-as eDP-1 || xrandr --output HDMI-1 --right-of eDP-1
