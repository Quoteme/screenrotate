#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
#

#######################################
# Disable keyboard and touchpad
#######################################
echo "Disabling keyboard and touchpad"
for id in $(xinput --list | sed -n '/.*Touchpad/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --disable $id
done
for id in $(xinput --list | sed -n '/.*Mouse/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --disable $id
done
for id in $(xinput --list | sed -n '/.*Keyboard/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --disable $id
done

#######################################
# Save current keyboard brightness
#######################################
# TODO: Change this to a more generic solution
brightnessctl --device="asus::kbd_backlight" get > /tmp/kbd_brightness_before_rotation
