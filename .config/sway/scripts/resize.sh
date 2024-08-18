#!/bin/sh
#
# $1 is the direction : left, right, up, bottom
# $2 is the amount : e.g. 40px (optional)
#
swaymsg resize grow $1 $2
if [ $? -ne 0 ]
then
  case $1 in
    'left')
      direction=right
      ;;
    'right')
      direction=left
      ;;
    'up')
      direction=down
      ;;
    'down')
      direction=up
      ;;
  esac
  swaymsg resize shrink $direction $2
fi
