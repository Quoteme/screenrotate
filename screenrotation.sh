#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2021-06-13 So 00:50 57
#
# This is a script that toggles rotation of the screen through xrandr,
# and also toggles rotation of the stylus, eraser and cursor through xsetwacom

screen=`xrandr --current | grep " connected" | awk '{print $1;}'`
orientation=`xrandr --verbose -q | grep $screen | awk '{print $6}'`
stylus_device=`xsetwacom --list devices | grep "STYLUS" | grep -o -P '(?<=id: ).*(?=type)'`
eraser_device=`xsetwacom --list devices | grep "ERASER" | grep -o -P '(?<=id: ).*(?=type)'`
touch_device=`xsetwacom --list devices | grep "TOUCH" | grep -o -P '(?<=id: ).*(?=type)'`

echo $screen
echo $orientation

function wacom_setup {
	xsetwacom set $stylus_device Rotate $1
	xsetwacom set $eraser_device Rotate $1
	xsetwacom set $touch_device Rotate $1
}

if [[ -z "$1" ]]; then
	echo "Missing argument!"
	echo "Possible values are: normal, inverted, left, right"
elif [ "$1" = "normal" ]; then
	xrandr --output $screen --rotate normal
	wacom_setup none
elif [ "$1" = "inverted" ]; then
	xrandr --output $screen --rotate inverted
	wacom_setup half
elif [ "$1" = "left" ]; then
	xrandr --output $screen --rotate left
	wacom_setup ccw
elif [ "$1" = "right" ]; then
	xrandr --output $screen --rotate right
	wacom_setup cw
fi
