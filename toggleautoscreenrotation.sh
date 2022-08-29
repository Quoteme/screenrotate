#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2022-01-18 Di 16:43 26
#
# @DESCRIPTION: This script is used to toggle the feature, that
# the screen is rotated when the laptop is rotated.

touch ~/.config/autoscreenrotate

AUTOROTATE=$( cat ~/.config/autoscreenrotate )

if ($AUTOROTATE = "true")
then
	echo "false" > ~/.config/autoscreenrotate
else
	echo "true" > ~/.config/autoscreenrotate
fi
