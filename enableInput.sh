#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
#

#######################################
# Enable keyboard and touchpad
#######################################
echo "Enabling keyboard and touchpad"
for id in $(xinput --list | sed -n '/.*Touchpad/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --enable $id
done
for id in $(xinput --list | sed -n '/.*Mouse/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --enable $id
done
for id in $(xinput --list | sed -n '/.*Keyboard/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --enable $id
done

#######################################
# Resore last keyboard brightness
#######################################
brightnessctl --device="asus::kbd_backlight" --restore
