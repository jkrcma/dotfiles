#!/bin/bash

MIC_LED=/sys/class/leds/platform::micmute/brightness

led_state=$( cat $MIC_LED )
case $led_state in
    0) new_state=1 ;;
    1) new_state=0 ;;
esac

pactl set-source-mute @DEFAULT_SOURCE@ $new_state
echo $new_state | sudo tee $MIC_LED
