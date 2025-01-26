#!/bin/sh

lock=" Lock"
exit="󰗼 Exit"
shutdown="󰐥 Poweroff"
reboot=" Reboot"
sleep=" Suspend"
yes="Yes"
no="No"

is_loginctl_available() {
    command -v loginctl >/dev/null 2>&1
}

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
        confirm "$exit" "$(is_loginctl_available && echo 'swaymsg exit' || echo 'systemctl --user exit')"
        ;;
    "$shutdown")
        confirm "$shutdown" "$(is_loginctl_available && echo 'loginctl poweroff' || echo 'systemctl poweroff')"
        ;;
    "$reboot")
        confirm "$reboot" "$(is_loginctl_available && echo 'loginctl reboot' || echo 'systemctl reboot')"
        ;;
    "$sleep")
        if is_loginctl_available; then
            loginctl suspend
        else
            systemctl suspend
        fi
        ;;
    *)
        echo "No match"
        ;;
esac

