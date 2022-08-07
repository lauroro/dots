#!/usr/bin/env bash

op=$( echo -e " Poweroff\n敏 Reboot\n Lock\n Logout\n Suspend" | wofi -s ~/.config/wofi/powermenu/style.css -c ~/.config/wofi/powermenu/config| awk '{print tolower($2)}' )


case $op in 
        poweroff)
                ;&
        reboot)
                ;&
        suspend)
                systemctl $op
                ;;
        lock)
		swaylock
                ;;
        logout)
                swaymsg exit
                ;;
esac
