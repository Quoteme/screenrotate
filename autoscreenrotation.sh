#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2021-11-07 So 19:12 32
#

function processnewcommand {
	case $1 in
		"Accelerometer orientation changed: normal")
			echo "screen rotated to normal"
			./screenrotation.sh "normal"
			;;
		"Accelerometer orientation changed: bottom-up")
			echo "screen rotated to inverted"
			./screenrotation.sh "inverted"
			;;
		"Accelerometer orientation changed: left-up")
			echo "screen rotated to left"
			./screenrotation.sh "left"
			;;
		"Accelerometer orientation changed: right-up")
			echo "screen rotated to right"
			./screenrotation.sh "right"
			;;
	esac
}

export -f processnewcommand
monitor-sensor | xargs --replace=% bash -c 'processnewcommand "%"'
