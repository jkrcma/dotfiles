#!/bin/bash
#
## Touchpad settings
dev_touchpad="SynPS/2 Synaptics TouchPad"
# Natural scrolling
xinput set-prop "$dev_touchpad" "libinput Natural Scrolling Enabled" 1
# Scrolling speed (lower means higher)
xinput set-prop "$dev_touchpad" "libinput Scrolling Pixel Distance" 10
