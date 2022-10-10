#!/bin/bash

status=$(playerctl -p spotify status)
artist=$(playerctl -p spotify metadata xesam:artist)
title=$(playerctl -p spotify metadata xesam:title)
album=$(playerctl -p spotify metadata xesam:album)

if [[ -z $status ]] 
then
   exit
fi

if [[ $status == "Playing" ]]
then
   echo "{\"class\": \"playing\", \"text\": \"$artist - $title\", \"tooltip\": \"$artist - $title - $album\"}"
   exit
fi

if [[ $status == "Paused" ]]
then
   echo "{\"class\": \"paused\", \"text\": \"$artist - $title\", \"tooltip\": \"$artist - $title - $album\"}"
   exit
fi

