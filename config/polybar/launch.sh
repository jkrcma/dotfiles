#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
retries=0
while pgrep -u $UID -x polybar >/dev/null; do
	if [ $retries -ge 3 ]; then
		# Polybar loves to get stuck :]
		killall -q -9 polybar
	fi
	sleep 1
	let "retries++"
done

# Launch bar1 and bar2
#if type "xrandr"; then
#	for m in $( xrandr --query | grep " connected" | cut -d" " -f1 ); do
#		MONITOR=$m polybar top -c ~/.config/polybar/config-top.ini &
#	done
#else
	polybar top -c ~/.config/polybar/config-top.ini &
#fi

polybar bottom -c ~/.config/polybar/config-bottom.ini &
