#! /bin/bash

CFG="$HOME/.config/wofi/launcher/config"
STYLE="$HOME/.config/wofi/style.css"


if [[ -z "$(pidof wofi)" ]];then
  wofi -c "$CFG" -s "$STYLE" --show drun
else
  killall wofi
fi
