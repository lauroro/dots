#!/bin/bash

status=$(playerctl -p spotify status)

if [[ -z $status ]] 
then
    exit
fi

if [[ $status == "Playing" ]]
then
   echo "{\"class\": \"playing\", \"text\": \"\", \"tooltip\": \"$album\"}"
   exit
fi

if [[ $status == "Paused" ]]
then
   echo "{\"class\": \"paused\", \"text\": \"\", \"tooltip\": \"$album\"}"
   exit
fi
