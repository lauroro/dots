# hyprland-dotfiles
My dotfiles for hyprland, a great wayland compositor

## Screenshots
![mar 11 ott 2022, 00:01:27, CEST](https://user-images.githubusercontent.com/88981092/195025474-1b3eacb8-5a37-4c39-be81-093de3c27131.png)
![mar 11 ott 2022, 00:40:36, CEST](https://user-images.githubusercontent.com/88981092/195025981-9399e0d8-5565-49fe-8ce7-5bdab804d4e0.png)
![mar 11 ott 2022, 00:03:54, CEST](https://user-images.githubusercontent.com/88981092/195025530-3f51e0b7-d326-4e4f-bfba-f867ce025fda.png)
![mar 11 ott 2022, 00:12:42, CEST](https://user-images.githubusercontent.com/88981092/195025558-f12a3aee-f635-4070-8789-e360ef8264c8.png)
![mar 11 ott 2022, 00:12:23, CEST](https://user-images.githubusercontent.com/88981092/195025601-f62a0f45-5108-440b-b1e5-52e384cd3110.png)
![mar 11 ott 2022, 00:13:12, CEST](https://user-images.githubusercontent.com/88981092/195025630-e681ba3e-1fc1-4078-8a7f-dd800fe71888.png)
![mar 11 ott 2022, 00:11:57, CEST](https://user-images.githubusercontent.com/88981092/195025674-6e11148b-a224-482d-a326-71e5ccacd62e.png)
![mar 11 ott 2022, 00:10:02, CEST](https://user-images.githubusercontent.com/88981092/195025811-5001fd2a-5819-427e-8616-9b8d67198306.png)
![2022-08-09-20:02:18](https://user-images.githubusercontent.com/88981092/183731639-92ce1648-e713-433d-b275-5ed3aab685e7.png)
![2022-08-09-20:03:07](https://user-images.githubusercontent.com/88981092/183731735-277c4b4e-5b96-459f-aec9-27d05c5bf589.png)
![2022-08-09-20:03:21](https://user-images.githubusercontent.com/88981092/183731804-07b051f2-21bf-44a9-8061-3ff960ecfcab.png)
![2022-08-09-20:05:42](https://user-images.githubusercontent.com/88981092/183731906-21878851-7d28-49a8-9f66-c1891119a9e8.png)
![2022-08-09-20:01:51](https://user-images.githubusercontent.com/88981092/183731975-4445e682-2ebc-4fca-8a9e-900e0fb919ac.png)




## Dependencies
**For Arch Linux with yay AUR helper**
```
yay -S hyprland-git swaybg grim slurp foot rofi-lbonn-wayland-git waybar-hyprland-git mako nerd-fonts-ubuntu-mono brightnessctl pactl perl zsh gtklock swayidle
yay -S hyprland-git swaybg grim slurp foot wofi waybar-hyprland-git dunst nerd-fonts-ubuntu-mono brightnessctl
```

I use systemd here and there. Not planning to do a version without it at the moment.

I also use ```oh-my-zsh```. 

Assuming you start from HOME. Run ```git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh```, backup your ```.zshrc```, copy my ```.zshrc``` in your home and you are done.

## How to change background
Copy the picture you want to set as background in your ```~/.config/hypr/``` folder.
Change its name in ```background```.
Press ```SUPER+SHIFT+b``` to change it now. It will be set automatically upon login. As a default the same background image will be used as the background in lockscreen.

## Some shortcuts
```SUPER+ENTER``` : foot
```SUPER+SPACE``` : rofi launcher
```SUPER+n```     : rofi networkmenu
```SUPER+p```     : rofi powermenu
Press ```SUPER+SHIFT+b``` to change it now. It will be set automatically upon login.
