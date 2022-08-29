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
	echo "false" > ~/.config/disableinput
else
	echo "true" > ~/.config/disableinput
fi
