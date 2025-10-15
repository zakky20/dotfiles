#!/usr/bin/env bash

COLORSCHEME=Nord

nm-applet &
blueman-applet &
/usr/bin/emacs --daemon &
nitrogen --restore &
dunst &
picom &

conky -c /home/zakky/NixOS/config/conky/conky.conf

xrandr --output HDMI-0 --mode 1920x1080 --rate 144 &
