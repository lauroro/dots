#!/bin/bash

if [[ "$1" == "--lock" ]]; then
	swaylock
elif [[ "$1" == "--logout" ]]; then
	loginctl kill-session self
elif [[ "$1" == "--suspend" ]]; then
	systemctl suspend
elif [[ "$1" == "--reboot" ]]; then
	systemctl reboot
elif [[ "$1" == "--poweroff" ]]; then
	systemctl poweroff
fi
