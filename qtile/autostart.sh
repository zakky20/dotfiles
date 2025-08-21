#!/usr/bin/env bash

COLORSCHEME=TokyoNight

emacs --daemon &
flameshot &
dunst &
picom &

exec /usr/local/bin/randomwallpaper &

xrandr --output HDMI-0 --mode 1920x1080 --rate 144 &
