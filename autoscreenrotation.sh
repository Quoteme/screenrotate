#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2021-11-07 So 19:12 32
#

#######################################
# This function is called each time `motion-sensor` writes to stdout.
# Also, some config files affect this function.
# - if ~/.config/autoscreenrotate is set to true, the screen will be
#   rotated with the device
# - if ~/.config/disableinput is set to true, the keyboard and touchpad
#   will be disabled while the laptop is rotated other than normal
# Arguments:
#   The line that was written to stdout.
#######################################
function processnewcommand {
	if ( ( $( cat ~/.config/autoscreenrotate ) = "false" ) )
	then
		exit
	fi
	case $1 in
		"Accelerometer orientation changed: normal")
			echo "screen rotated to normal"
			screenrotation.sh "normal"
      if ( ( $( cat ~/.config/disableinput ) = "true" ) )
      then
        enableInput.sh
      fi
			;;
		"Accelerometer orientation changed: bottom-up")
			echo "screen rotated to inverted"
			screenrotation.sh "inverted"
      if ( ( $( cat ~/.config/disableinput ) = "true" ) )
      then
        disableInput.sh
      fi
			;;
		"Accelerometer orientation changed: left-up")
			echo "screen rotated to left"
			screenrotation.sh "left"
      if ( ( $( cat ~/.config/disableinput ) = "true" ) )
      then
        disableInput.sh
      fi
			;;
		"Accelerometer orientation changed: right-up")
			echo "screen rotated to right"
			screenrotation.sh "right"
      if ( ( $( cat ~/.config/disableinput ) = "true" ) )
      then
        disableInput.sh
      fi
			;;
	esac
}

export -f processnewcommand
monitor-sensor | xargs --replace=% bash -c 'processnewcommand "%"'
