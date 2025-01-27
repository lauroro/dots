#!/bin/sh

gnome_schema="org.gnome.desktop.interface"

gsettings set "$gnome_schema" gtk-theme Base16
gsettings set "$gnome_schema" icon-theme Adwaita
gsettings set "$gnome_schema" cursor-theme BreezeX-Dark
gsettings set "$gnome_schema" cursor-size 24
gsettings set "$gnome_schema" monospace-font-name 'Iosevka Nerd Font 11'
