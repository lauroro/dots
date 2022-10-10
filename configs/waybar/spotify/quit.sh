#!/bin/bash

if pgrep spotify
then
    kill -SIGINT $(pgrep spotify)
fi

pkill -RTMIN+4 waybar
