# hyprland-dotfiles
My dotfiles for hyprland, a great wayland compositor

## Screenshots
![ven 18 nov 2022, 15:32:32, CET](https://user-images.githubusercontent.com/88981092/202730816-24804d84-7425-4a9e-b859-8576d9a85ce0.png)
![ven 18 nov 2022, 15:33:02, CET](https://user-images.githubusercontent.com/88981092/202730908-c90b88f9-3d1a-4862-9ab0-57a4132d5918.png)
![ven 18 nov 2022, 15:33:29, CET](https://user-images.githubusercontent.com/88981092/202730961-0a4a3f71-55f0-4f89-8a86-352f518072f1.png)
![ven 18 nov 2022, 15:58:46, CET](https://user-images.githubusercontent.com/88981092/202734369-174cc853-56ff-4fa5-86e4-813b0f4e65d8.png)
![ven 18 nov 2022, 15:34:20, CET](https://user-images.githubusercontent.com/88981092/202731134-858d0a4b-b6fa-442f-abe2-e960adc363f9.png)
![ven 18 nov 2022, 15:31:48, CET](https://user-images.githubusercontent.com/88981092/202731176-cb771b59-148c-4e6d-a637-a3517bca2638.png)



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
