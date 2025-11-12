#!/bin/sh

# ---------- IDLE ----------
pkill swayidle
swayidle -w \
  timeout 300 'swaylock -f' \
  timeout 310 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
  before-sleep 'swaylock -f; sleep 1' &

# ---------- GSETTINGS ----------
gsettings set org.gnome.desktop.interface gtk-theme 'Base16'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Simp1e-Dark'
gsettings set org.gnome.desktop.interface cursor-size 24
gsettings set org.gnome.desktop.interface monospace-font-name 'Iosevka Nerd Font 11'

# ---------- SHELL ----------
pkill -x waybar || true; waybar &
pkill -x mako || true; mako &

# ---------- BG ----------
pkill swaybg; swaybg -c "#3c3836" &
