#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2021-11-07 So 19:12 32
#

function processnewcommand {
	case $1 in
		"Accelerometer orientation changed: normal")
			echo "screen rotated to normal"
			# xinput --enable "MSFT0001:00 06CB:CE2D Touchpad"
			# xinput --enable "AT Translated Set 2 keyboard"
			screenrotation.sh "normal"
			;;
		"Accelerometer orientation changed: bottom-up")
			echo "screen rotated to inverted"
			# xinput --disable "MSFT0001:00 06CB:CE2D Touchpad"
			# xinput --disable "AT Translated Set 2 keyboard"
			screenrotation.sh "inverted"
			;;
		"Accelerometer orientation changed: left-up")
			echo "screen rotated to left"
			screenrotation.sh "left"
			# xinput --disable "MSFT0001:00 06CB:CE2D Touchpad"
			# xinput --disable "AT Translated Set 2 keyboard"
			;;
		"Accelerometer orientation changed: right-up")
			echo "screen rotated to right"
			screenrotation.sh "right"
			# xinput --disable "MSFT0001:00 06CB:CE2D Touchpad"
			# xinput --disable "AT Translated Set 2 keyboard"
			;;
	esac
}

export -f processnewcommand
monitor-sensor | xargs --replace=% bash -c 'processnewcommand "%"'
