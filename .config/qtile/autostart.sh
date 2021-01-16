#!/usr/bin/env bash

#xrandr --output DisplayPort-0 --primary --mode 2560x1080 --output HDMI-A-0 --mode 1920x1080 --below DisplayPort-0 --output DisplayPort-1 --mode 1600x900 --right-of HDMI-A-0 &
nitrogen --restore &
tablet.sh &
redshift -P -O 4000 &
# Autostart applications
chromium &
emacs &
nautilus &
alacritty &
