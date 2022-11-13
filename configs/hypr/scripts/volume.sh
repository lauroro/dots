#!/bin/sh

CURRENT=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -e '%' | sed 's/ //g' | cut -d "/" -f 2 | sed 's/%//')

up() {
  new=$(($CURRENT+5))
  if [ $new -lt 100 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ $new%
  else
    pactl set-sink-volume @DEFAULT_SINK@ 100%
  fi
}

down() {
  new=$(($CURRENT-5))
  if [ $new -gt 0 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ $new%
  else
    pactl set-sink-volume @DEFAULT_SINK@ 0%
  fi
}



if [[ "$1" == "--up" ]];then
  up
elif [[ "$1" == "--down" ]];then
  down
fi
