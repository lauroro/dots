# hyprland-dotfiles
My dotfiles for hyprland, a great wayland compositor.

## Screenshots [outdated]
![combine_images(2)](https://user-images.githubusercontent.com/88981092/206405811-482a4ef6-af0d-4e4d-a1b8-4ba082dec349.jpg)


## Dependencies

```hyprland```                  : wayland compositor

```swaybg```                    : background

```swaylock-effects```          : lock screen

```swayidle```                  : for autolock and lock before suspend

```grim, slurp```               : screenshots (both)

```wl-clipboard```              : clipboard tool

```mako```                      : notifications

```xdg-user-dirs```             : for the usual home folders

```wofi```                      : app-launcher and network menu

```eww-wayland```               : bar, dashboard, calendar

```foot```                      : terminal emulator

```Ubuntu Mono Nerd Font```     : nerd font, used everywhere

```zsh```                       : shell

```starship```                  : prompt tool (append this on .zshrc : eval "$(starship init zsh)")

```thunar```                    : gui file manager, consider eventaul plugins...

```gvfs```                      : required by thunar

```file-roller```               : gui archive tool (also install thunar-archive-plugin for thunar integration)

```gsettings-desktop-schemas``` : to change gtk theme

```Kripton```                   : gtk theme

```Qogir-cursors```             : cursor-theme

```playerctl```                 : mpris controller

```networkmanager```            : networking, requires also polkit

```brightnessctl```             : backlight (add yourself to video group)


For gtk settings (theme, icons, cursor)
https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland


## How to change background
Copy the picture you want to set as background in your ```~/.config/``` folder.
Change its name in ```background```.
Press ```SUPER+b``` to change it now. It will be set automatically upon login. As a default the same background image will be used as the background in lockscreen.

## Some shortcuts
```SUPER+ENTER``` : foot

```SUPER+SPACE``` : wofi launcher

```SUPER+n```     : wofi networkmenu

```SUPER+d```     : eww dashboard

```SUPER+t```     : thunar
