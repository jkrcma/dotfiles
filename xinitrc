#!/bin/bash
#
## Touchpad settings
dev_touchpad="SYNA8018:00 06CB:CE67 Touchpad"
# Natural scrolling
xinput set-prop "$dev_touchpad" "libinput Natural Scrolling Enabled" 1
# Scrolling speed (lower means higher)
xinput set-prop "$dev_touchpad" "libinput Scrolling Pixel Distance" 10
