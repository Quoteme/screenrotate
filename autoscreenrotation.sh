#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2021-11-07 So 19:12 32
#

#######################################
# Enable keyboard and touchpad
#######################################
function enableInput() {
  for id in $(xinput --list | sed -n '/.*Mouse/s/.*=\([0-9]\+\).*/\1/p')
  do
    xinput --enable $id
  done
  for id in $(xinput --list | sed -n '/.*Keyboard/s/.*=\([0-9]\+\).*/\1/p')
  do
    xinput --enable $id
  done
}

#######################################
# Disable keyboard and touchpad
#######################################
function disableInput() {
  for id in $(xinput --list | sed -n '/.*Mouse/s/.*=\([0-9]\+\).*/\1/p')
  do
    xinput --disable $id
  done
  for id in $(xinput --list | sed -n '/.*Keyboard/s/.*=\([0-9]\+\).*/\1/p')
  do
    xinput --disable $id
  done
}

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
      if ( ( $( cat ~/.config/disableinput ) = "true" ) )
      then
        enableInput
      fi
			screenrotation.sh "normal"
			;;
		"Accelerometer orientation changed: bottom-up")
			echo "screen rotated to inverted"
      if ( ( $( cat ~/.config/disableinput ) = "false" ) )
      then
        disableInput
      fi
			screenrotation.sh "inverted"
			;;
		"Accelerometer orientation changed: left-up")
			echo "screen rotated to left"
      if ( ( $( cat ~/.config/disableinput ) = "false" ) )
      then
        disableInput
      fi
			screenrotation.sh "left"
			;;
		"Accelerometer orientation changed: right-up")
			echo "screen rotated to right"
      if ( ( $( cat ~/.config/disableinput ) = "false" ) )
      then
        disableInput
      fi
			screenrotation.sh "right"
			;;
	esac
}

export -f processnewcommand
monitor-sensor | xargs --replace=% bash -c 'processnewcommand "%"'
