#!/bin/bash


## ROFI VARIABLES ##
ROFI1="rofi -dmenu -l 10 -p -i -theme ~/.config/rofi/network/network-shared.rasi"
ROFI2="rofi -dmenu -l 5 -p -i -theme ~/.config/rofi/network/network-connections.rasi"
ROFI3="rofi -dmenu -l 1 -p -theme ~/.config/rofi/network/network-password.rasi"

## MAIN OPTIONS ##
option1="  Turn on WiFi"
option2="  Turn off WiFi"
option3="睊 Disconnect WiFi"
option4="直 Connect WiFi"
option5=" Exit"
options="$option1\n$option2\n$option3\n$option4\n$option5"

wlan=$(nmcli dev | grep wifi | sed 's/ \{2,\}/|/g' | cut -d '|' -f1 | head -1)

## TURN OFF WIFI FUNCTION ##
turnoff() {
  nmcli radio wifi off
  notify-send "  WiFi turned off"
}

## TURN ON WIFI FUNCTION ##
turnon() {
  nmcli radio wifi on
  notify-send "  WiFi turned on"
}

## DISCONNECT WIFI FUNCTION ##
disconnect() {
  nmcli device disconnect "$wlan"
  constate=$(nmcli dev | grep wifi | sed 's/ \{2,\}/|/g' | cut -d '|' -f3 | head -1)
  if [ "$constate" = "disconnected" ]; then
    notify-send "睊 WiFi has been disconnected"
  fi
}

## CONNECT FUNCTION ##
connect() {
  notify-send "直 Scannig networks..."
  bssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | $ROFI2 "" | cut -d' ' -f1)
}

## SELECT PASSWORD FUNCTION ##
password() {
  pass=$($ROFI3 "")
}

## MAIN CONNECTION COMMAND ##
action() {
  nmcli device wifi connect "$bssid" password "$pass" || nmcli device wifi connect "$bssid"
}

## CHECK ACTION ##
check-action() {
  cases=$(echo -e "$options" | $ROFI1 "" )
  case "$cases" in
    $option1)
      turnon;;
    $option2)
      turnoff;;
    $option3)
      disconnect;
      exit 0;;
    $option4)
      connect;
      password;
      action;
      exit 0;;
    $option5)
      exit 0
  esac
}

# MAIN #
main() {
  while true
  do
    check-action
  done
}

main
