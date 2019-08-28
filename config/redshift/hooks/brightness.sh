#!/bin/sh

# set brightness values for each status
brightness_day=255
brightness_transition=128
brightness_night=60
# set fade time for changes to one minute
fade_time=60

function do_fade {
	target=$1
	current=$( brightnessctl g )
	let steps=$current-$target

	op='-'
	if [ "${steps:0:1}" = '-' ]; then
		op='+'
		steps=${steps:1}
	fi

	time_step=$( python -c "print(round($fade_time/$steps, 3))" )
	for i in $( seq 1 $steps ); do
		brightnessctl s 1$op
		sleep $time_step
	done
}

if [ "$1" = period-changed ]; then
	case $3 in
		night)
			do_fade $brightness_night
			;;
		transition)
			do_fade $brightness_transition
			;;
		daytime)
			do_fade $brightness_day
			;;
	esac
fi
