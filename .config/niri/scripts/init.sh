#!/bin/sh

# ---------- IDLE ----------
pkill swayidle
swayidle -w \
  timeout 300 'swaylock -f' \
  timeout 310 'niri msg action power-off-monitors' \
  resume 'niri msg action power-on-monitors' \
  before-sleep 'swaylock -f; sleep 1' &

# ---------- GSETTINGS ----------
gsettings set org.gnome.desktop.interface gtk-theme 'Base16'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Simp1e-Dark'
gsettings set org.gnome.desktop.interface cursor-size 24
gsettings set org.gnome.desktop.interface monospace-font-name 'Iosevka Nerd Font 11'

# ---------- SHELL ----------
pkill -x waybar || true; waybar > /dev/null 2>&1 &
pkill -x mako || true; mako &

# ---------- BG ----------
# <%pyrice:base01:3c3836>
pkill swaybg; swaybg -c "#3c3836" &
