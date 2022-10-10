#!/bin/bash

status=$(playerctl -p spotify status)

if [[ -z $status ]] 
then
    exit
fi

if [[ $1 == "prev" ]]
then
   playerctl -p spotify previous
   exit
fi

if [[ $1 == "next" ]]
then
   playerctl -p spotify next
   exit
fi

if [[ $status == "Playing" ]]
then
   playerctl -p spotify pause
   sleep .1
   pkill -RTMIN+4 waybar
   exit
fi

if [[ $status == "Paused" ]]
then
   playerctl -p spotify play
   sleep .1
   pkill -RTMIN+4 waybar
   exit
fi

