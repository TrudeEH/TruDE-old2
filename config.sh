#! /bin/bash

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

dialog  --clear --title "TruDE configurator" \
        --menu "Choose a setting below:" 20 51 4 \
        "Wallpaper"  "Call nitrogen to change wallpaper settings" \
        "----" "----" \
        "----" "----" \
        "----" "----" \
        "----" "----" \
        "----" "----" 2> $tempfile

retval=$?
choice=`cat $tempfile`

case $retval in
  0)
    case $choice in
	Wallpaper)
		nitrogen &;;
    esac
    ;;
  1)
    echo "Cancel pressed.";;
  255)
    echo "ESC pressed.";;
esac
clear
