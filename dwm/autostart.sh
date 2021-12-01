killall compton ; compton --backend glx --unredir-if-possible --vsync opengl-swc &
nitrogen --restore &

while :; do
	xsetroot -name "Date: $(date +"%d/%m/%y") | Time: $(date +"%H:%M") | Battery: $(cat /sys/class/power_supply/*/capacity)"
	sleep 1m #Update the bar every minute
done &
