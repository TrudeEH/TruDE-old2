#! /bin/bash

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

dialog  --clear --title "TruDE configurator" \
        --menu "Choose a setting below:" 20 51 4 \
        "Wallpaper"  "Call nitrogen to change wallpaper settings" \
        "WiFi" "Configure network connections" \
        "----" "----" \
        "----" "----" \
        "----" "----" \
        "----" "----" 2> $tempfile

clear
retval=$?
choice=`cat $tempfile`

wifi () {
	clear
	# Enable the wifi device
	wifiUp="$(nmcli radio wifi)"
	if [ $wifiUp != "enabled" ]
	then
		echo "Enabling WiFi..."
		nmcli radio wifi on
	else
		echo "The WiFi is already on."
	fi
	echo "Looking for wifi networks..."
	nmcli -p -f SSID,SIGNAL,BARS,SECURITY device wifi
	read -p "SSID: " ssid
	sudo nmcli -p --ask dev wifi connect $ssid
}

case $retval in
  0)
    case $choice in
	Wallpaper)
		nitrogen &;;
	WiFi)
		wifi;;
    esac
    ;;
  1)
    echo "Cancel pressed.";;
  255)
    echo "ESC pressed.";;
esac
