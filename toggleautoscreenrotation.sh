#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2022-01-18 Di 16:43 26
#


mkdir -p ~/.config/flex5screenrotate
touch ~/.config/flex5screenrotate/autorotate

AUTOROTATE=$( cat ~/.config/flex5screenrotate/autorotate )

if ($AUTOROTATE = "true")
then
	echo "false" > ~/.config/flex5screenrotate/autorotate
else
	echo "true" > ~/.config/flex5screenrotate/autorotate
fi
