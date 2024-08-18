#!/bin/sh

exec swayidle -w \
  timeout 300 'swaylock -f' \
  timeout 310 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' \
  before-sleep 'swaylock -f; sleep 1'
