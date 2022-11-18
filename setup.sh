#! /bin/bash

yay -S hyprland swaybg grim slurp foot \
        wofi waybar-hyprland-git mako \
        ttf-ubuntumono-nerd brightnessctl \
        libpulse pulseaudio zsh swayidle \
        gvfs thunar thunar-archive-plugin \
        gsettings-desktop-schemas file-roller \
        kimi-dark-gtk-theme-git starship \
        networkmanager feh playerctl \
        swaylock-effects wl-clipboard \
        xdg-user-dirs pfetch htop
        
echo "**** PKGS INSTALLED ****"
cd
git clone https://github.com/lauroro/hyprland-dotfile
echo "**** DOTFILES DOWNLOADED ****"
cd hyprland-dotfile/configs
cp -r * ../../.config/
echo "**** DONE! ****"
