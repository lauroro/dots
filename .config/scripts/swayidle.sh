#!/bin/sh

swayidle -w \
  timeout 300   'gtklock -d' \
  timeout 310   'hyprctl dispatch dpms off' \
  resume        'hyprctl dispatch dpms on' \
  before-sleep  'gtklock -d; sleep 1'
