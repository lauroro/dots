#!/bin/sh

gnome_schema="org.gnome.desktop.interface"

gsettings set "$gnome_schema" gtk-theme Base16
gsettings set "$gnome_schema" icon-theme oomox-gruvbox-dark-medium
gsettings set "$gnome_schema" cursor-theme Yaru
