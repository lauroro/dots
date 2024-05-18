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
    gtklock -d
    ;;
  "$exit")
    confirm "$exit" "hyprctl dispatch exit"
    ;;
  "$shutdown")
    confirm "$shutdown" "systemctl poweroff"
    ;;
  "$reboot")
		confirm "$reboot" "systemctl reboot"
    ;;
  "$sleep")
    systemctl suspend
    ;;
  *)
    echo "No match"
    ;;
esac
