#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2022-01-18 Di 16:43 26
#
# @DESCRIPTION: This script is used to toggle the feature, that
# the keyboard and touchpad are disabled when the laptop is rotated.


touch ~/.config/disableinput

AUTOROTATE=$( cat ~/.config/disableinput )

if ($AUTOROTATE = "true")
then
  notify-send "Input" "Input will now be left enabled on rotation" 
	echo "false" > ~/.config/disableinput
else
  notify-send "Input" "Input will now be disabled on rotation"
	echo "true" > ~/.config/disableinput
fi
