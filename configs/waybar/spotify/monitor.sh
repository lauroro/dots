#!/bin/bash

sleep .1
pkill -RTMIN+5 waybar

if pgrep spotify > /dev/null
then
    pkill -RTMIN+6 waybar
fi

