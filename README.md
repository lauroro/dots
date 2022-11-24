# hyprland-dotfiles
My dotfiles for hyprland, a great wayland compositor

## Screenshots
![gio 24 nov 2022, 09:59:46, CET](https://user-images.githubusercontent.com/88981092/203768404-a96f3470-a646-4c70-903d-530ccfc87d3f.png)
![gio 24 nov 2022, 10:00:11, CET](https://user-images.githubusercontent.com/88981092/203768489-7f2846bc-fb1f-409d-a231-d7b0abbd0039.png)
![gio 24 nov 2022, 10:04:07, CET](https://user-images.githubusercontent.com/88981092/203768523-deb4debf-ac76-44e3-897c-b148be1aad3f.png)
![gio 24 nov 2022, 10:04:36, CET](https://user-images.githubusercontent.com/88981092/203768539-f010b548-221d-431c-b582-e8a743cbba3c.png)
![gio 24 nov 2022, 10:04:55, CET](https://user-images.githubusercontent.com/88981092/203768565-008ce6e3-f87a-44bb-b817-a91a7ac082e8.png)
![gio 24 nov 2022, 12:12:03, CET](https://user-images.githubusercontent.com/88981092/203770412-1dd04912-7e5f-4611-86a3-e1542c2dc880.png)





## Dependencies
This config is made to be compatible with systemd-free OSs.

### Packages
```hyprland```                  : wayland compositor

```swaybg```                    : background

```swaylock-effetch```          : lock screen

```swayidle```                  : for autolock and lock before suspend

```grim, slurp```               : screenshots (both)

```wl-clipboard```              : clipboard tool

```mako```                      : notifications

```xdg-user-dirs```             : for the usual home folders

```wofi```                      : app-launcher and network menu

```eww```                       : bar, dashboard, calendar

```foot```                      : terminal emulator

```Ubuntu Mono Nerd```          : nerd font, used everywhere

```zsh```                       : shell

```starship```                  : prompt tool

```thunar```                    : gui file manager

```gvfs```                      : required by thunar

```file-roller```               : gui archive tool (also install thunar-archive-plugin for thunar integration)

```gsettings-desktop-schemas``` : to change gtk theme

```kimi-dark-gtk```             : gtk theme

```pulseaudio```                : audio

```playerctl```                 : mpris controller

```networkmanager```            : networking

```brightnessctl```             : backlight


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
