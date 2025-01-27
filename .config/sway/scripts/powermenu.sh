#!/bin/sh

lock=" Lock"
exit="󰗼 Exit"
shutdown="󰐥 Poweroff"
reboot=" Reboot"
sleep=" Suspend"
yes="Yes"
no="No"

confirm() {
	res=$(echo \
"$no
$yes" \
| fuzzel -d --lines 5 --width 14 -p "$1"?)

	case $res in
		"$yes")
			$2
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
$shutdown" | fuzzel -d --lines 5 --width 14 )

case $selected_option in
    "$lock")
        swaylock
        ;;
    "$exit")
        confirm "$exit" "swaymsg exit"
        ;;
    "$shutdown")
        confirm "$shutdown" "loginctl poweroff"
        ;;
    "$reboot")
        confirm "$reboot" "loginctl reboot"
        ;;
    "$sleep")
					loginctl suspend
        ;;
    *)
        echo "No match"
        ;;
esac

