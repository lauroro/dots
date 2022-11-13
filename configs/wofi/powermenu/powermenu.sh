#! /bin/bash

CFG="$HOME/.config/wofi/powermenu/config"
STYLE="$HOME/.config/wofi/style.css"

lock=" Lock"
logout=" Logout"
shutdown=" Poweroff"
reboot=" Reboot"
sleep=" Sleep"
entries="$lock\n$logout\n$sleep\n$reboot\n$shutdown"

connect() {
  selected=$(echo -e $entries | wofi -c "$CFG" -s "$STYLE" --show dmenu)


  if [ "$selected" == "$lock" ];then
    swaylock
  elif [ "$selected" == "$logout" ];then
    loginctl kill-session self
  elif [ "$selected" == "$shutdown" ];then
    systemctl poweroff
  elif [ "$selected" == "$reboot" ];then
    systemctl reboot
  elif [ "$selected" == "$sleep" ];then
    systemctl suspend
  fi
}


if [[ -z "$(pidof wofi)" ]];then
  connect
else
  killall wofi
fi
