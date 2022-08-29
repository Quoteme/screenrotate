#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
#

echo "Enabling keyboard and touchpad"
for id in $(xinput --list | sed -n '/.*Touchpad/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --enable $id
done
for id in $(xinput --list | sed -n '/.*Mouse/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --enable $id
done
for id in $(xinput --list | sed -n '/.*Keyboard/s/.*=\([0-9]\+\).*/\1/p')
do
  xinput --enable $id
done
