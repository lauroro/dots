#!/bin/bash


CFG="$HOME/.config/hypr/network/config"
STYLE="$HOME/.config/wofi/style.css"


connect() {
  ssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | wofi -c "$CFG" -s "$STYLE" --show dmenu --prompt "Scanning networks..." | cut -d' ' -f3)
  if [[ ! -z "$ssid" ]];then
    pass=$(echo -e 'Type password for connection "$ssid"' | wofi -c "$CFG" -s "$STYLE" --show dmenu --prompt "Type password here.")
    nmcli device wifi connect "$ssid" password "$pass" || nmcli device wifi connect "$ssid"
  fi
}



if [[ -z "$(pidof wofi)" ]];then
  connect
else
  killall wofi
fi
