# hyprland-dotfiles
My dotfiles for hyprland, a great wayland compositor.

## Screenshots
![Preview](preview.jpg)


## Dependencies

```hyprland```                                : wayland compositor

```swaybg```                                  : background

```swaylock-effects```                        : lock screen

```swayidle```                                : for autolock and lock before suspend

```grim, slurp```                             : screenshots (both)

```wl-clipboard```                            : clipboard tool

```dunst```                                   : notifications

```xdg-user-dirs```                           : for the usual home folders

```rofi-wayland```                            : app-launcher and powermenu

```viewnior```                                : img viewer

```eww-wayland```                             : bar, dashboard

```foot```                                    : terminal emulator

```JetBrains Mono Nerd Font```                : nerd font, used everywhere

```zsh```                                     : shell

```starship```                                : prompt tool (append this on .zshrc : eval "$(starship init zsh)")

```thunar```                                  : gui file manager

```thunar-volman, thunar-archive-plugin```    : thunar plugins

```gvfs```                                    : required by thunar

```file-roller```                             : gui archive tool (also install thunar-archive-plugin for thunar integration)

```gsettings-desktop-schemas, lxappearance``` : to change gtk and cursor themes

```Kripton```                                 : gtk theme

```Qogir-cursors```                           : cursor-theme

```playerctl```                               : mpris controller

```networkmanager, polkit, dbus```            : networking

```brightnessctl```                           : backlight (add yourself to video group)

```helix```                                   : text editor



For gtk settings (theme, icons, cursor)
https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland


## How to change background
Copy the picture you want to set as background in your ```~/.config/``` folder.
Change its name in ```background```.
Press ```SUPER+b``` to change it now. It will be set automatically upon login. As a default the same background image will be used as the background in lockscreen.

## Some shortcuts
```SUPER+ENTER``` : foot

```SUPER+SPACE``` : rofi launcher

```SUPER+d```     : rofi powermenu

```SUPER+d```     : eww dashboard

```SUPER+t```     : thunar
