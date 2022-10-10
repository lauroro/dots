#!/bin/sh

STRING=$(perl ~/.config/hypr/scripts/check-volume.pl 0) 
current=${STRING//[!0-9]/}
new=$(($current-5))
newPercentage="${new}%"
if [ $new -gt 0 ]; then
  pactl set-sink-volume 0 $newPercentage
else
   pactl set-sink-volume 0 0%
fi