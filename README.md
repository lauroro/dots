# hyprland-dotfiles
My dotfiles for hyprland, a great wayland compositor

## Screenshots [outdated]
![mar 11 ott 2022, 00:01:27, CEST](https://user-images.githubusercontent.com/88981092/195025474-1b3eacb8-5a37-4c39-be81-093de3c27131.png)
![mar 11 ott 2022, 00:40:36, CEST](https://user-images.githubusercontent.com/88981092/195025981-9399e0d8-5565-49fe-8ce7-5bdab804d4e0.png)
![mar 11 ott 2022, 00:03:54, CEST](https://user-images.githubusercontent.com/88981092/195025530-3f51e0b7-d326-4e4f-bfba-f867ce025fda.png)
![mar 11 ott 2022, 00:12:42, CEST](https://user-images.githubusercontent.com/88981092/195025558-f12a3aee-f635-4070-8789-e360ef8264c8.png)
![mar 11 ott 2022, 00:12:23, CEST](https://user-images.githubusercontent.com/88981092/195025601-f62a0f45-5108-440b-b1e5-52e384cd3110.png)
![mar 11 ott 2022, 00:13:12, CEST](https://user-images.githubusercontent.com/88981092/195025630-e681ba3e-1fc1-4078-8a7f-dd800fe71888.png)
![mar 11 ott 2022, 00:11:57, CEST](https://user-images.githubusercontent.com/88981092/195025674-6e11148b-a224-482d-a326-71e5ccacd62e.png)
![mar 11 ott 2022, 00:10:02, CEST](https://user-images.githubusercontent.com/88981092/195025811-5001fd2a-5819-427e-8616-9b8d67198306.png)





## Dependencies
**For Arch Linux with yay AUR helper**
```
yay -S hyprland-git swaybg grim slurp foot wofi waybar-hyprland-git mako ttf-ubuntumono-nerd brightnessctl libpulse zsh swayidle gvfs thunar xfce4-settings kimi-dark-gtk-theme-git file-roller starship networkmanager feh playerctl swaylock wl-clipboard xdg-user-dirs
```


Enable networkmanager:
```
sudo systemctl enable NetworkManager
```

## How to change background
Copy the picture you want to set as background in your ```~/.config/hypr/``` folder.
Change its name in ```background```.
Press ```SUPER+SHIFT+b``` to change it now. It will be set automatically upon login. As a default the same background image will be used as the background in lockscreen.

## Some shortcuts
```SUPER+ENTER``` : foot
```SUPER+SPACE``` : wofi launcher
```SUPER+n```     : wofi networkmenu
```SUPER+d```     : eww dashboard
```SUPER+t```     : thunar
