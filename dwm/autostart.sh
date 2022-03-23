#killall compton ; compton --backend glx --unredir-if-possible --vsync opengl-swc &
killall picom ; picom -b --experimental-backends --config ~/TruDE/picom.conf
nitrogen --restore &
exec slstatus &

