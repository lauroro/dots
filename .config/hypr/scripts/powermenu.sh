#!/bin/sh

lock=" Lock"
exit="󰗼 Exit"
shutdown="󰐥 Poweroff"
reboot=" Reboot"
sleep=" Suspend"
yes="Yes"
no="No"


confirm() {
    res=$(echo -e "$no\n$yes" | tofi --prompt-text "$1?")
    
    case $res in
        "$yes")
            eval $2
        ;;
        *)
            echo "$no"
        ;;
    esac
}

selected_option=$(echo "$lock
$exit
$sleep
$reboot
$shutdown" | tofi )

case $selected_option in
    "$lock")
        swaylock
        ;;
    "$exit")
        confirm "$exit" "hyprctl dispatch exit"
        ;;
    "$shutdown")
        confirm "$shutdown" "loginctl poweroff"
        ;;
    "$reboot")
        confirm "$reboot" "loginctl reboot"
        ;;
    "$sleep")
        confirm "$sleep" "loginctl suspend"
        ;;
    *)
        echo "No match"
        ;;
esac

