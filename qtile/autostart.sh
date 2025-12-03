#!/usr/bin/env bash

COLORSCHEME=Nord

blueman-applet &
nitrogen --restore &
emacs --daemon &
picom &
dunst &
udiskie &
flameshot &

xrandr --output HDMI-0 --mode 1920x1080 --rate 144 &
