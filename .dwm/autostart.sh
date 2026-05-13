#!/bin/sh

# keyboard
setxkbmap us -variant intl &

# numlock
numlockx &

# cursor
xsetroot -cursor_name left_ptr

# disable bell
xset -b

# monitors
xrandr \
  --output HDMI-A-0 \
  --mode 1920x1080 \
  --rate 60 \
  --primary \
  --output DVI-D-0 \
  --mode 1366x768 \
  --rate 60 \
  --left-of HDMI-A-0 \
  --rotate left

# wallpaper
"$HOME"/.config/feh/set_bg &

# audio
gentoo-pipewire-launcher &

# compositor
pkill picom
picom --config "$HOME"/.config/picom/picom.conf --daemon

# notifications
pkill dunst
dunst &

# automount
pkill udiskie
udiskie --notify &

# statusbar
pkill -f dwm_status
"$HOME"/.local/bin/dwm_status &
