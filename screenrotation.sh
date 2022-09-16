#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2021-06-13 So 00:50 57
#
# This is a script that toggles rotation of the screen through xrandr,
# and also toggles rotation of the stylus, eraser and cursor through xsetwacom

# screen=`xrandr --current | grep " connected" | awk '{print $1;}'`
screen="eDP"
orientation=`xrandr --verbose -q | grep $screen | awk '{print $6}'`

echo $screen
echo $orientation

function wacom_setup {
  stylus_device=`xsetwacom --list devices | grep "STYLUS" | grep -o -P '(?<=id: ).*(?=type)'`
  eraser_device=`xsetwacom --list devices | grep "ERASER" | grep -o -P '(?<=id: ).*(?=type)'`
  touch_device=`xsetwacom --list devices | grep "TOUCH" | grep -o -P '(?<=id: ).*(?=type)'`
	xsetwacom set $stylus_device Rotate $1
	xsetwacom set $eraser_device Rotate $1
	xsetwacom set $touch_device Rotate $1
}

function xinput_setup {
  # For stylus support
  for id in $(xinput --list | sed -n '/.*Stylus/s/.*=\([0-9]\+\).*/\1/p')
  do
    echo $screen
    xinput map-to-output $id $screen
  done

  # ASUS ROG Flow X13
  xinput map-to-output "ELAN9008:00 04F3:2C82" eDP
}

function cycle_left {
	case "$orientation" in
		"normal")
			rotate "left"
			;;
		"left")
			rotate "inverted"
			;;
		"inverted")
			rotate "right"
			;;
		"right")
			rotate "normal"
			;;
	esac
}

function cycle_right {
	case "$orientation" in
		"normal")
			rotate "right"
			;;
		"right")
			rotate "inverted"
			;;
		"inverted")
			rotate "left"
			;;
		"left")
			rotate "normal"
			;;
	esac
}

function swap {
	case "$orientation" in
		"normal")
			rotate "inverted"
			;;
		"inverted")
			rotate "normal"
			;;
		"left")
			rotate "right"
			;;
		"right")
			rotate "left"
			;;
	esac
}

function rotate {
	if [[ -z "$1" ]]; then
		echo "Missing argument!"
		echo "Possible values are: normal, inverted, left, right, cycle_left, cycle_right, swap"
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
	# Cycling
	elif [ "$1" = "cycle_left" ]; then
		cycle_left
	elif [ "$1" = "cycle_right" ]; then
		cycle_right
	# Swapping
	elif [ "$1" = "swap" ]; then
		swap
	fi
  xinput_setup
}

rotate $1
