#!/bin/sh

exec swayidle -w \
  timeout 300 'swaylock -f' \
  timeout 310 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  before-sleep 'swaylock -f; sleep 1'
