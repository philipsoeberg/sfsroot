#!/bin/bash

id=$(cat /sys/class/dmi/id/board_name 2>/dev/null)
if [[ "x$id" == "xMinnowBoard Turbot" ]]; then
  echo "$0: Setting D2 LED on MinnowBoard Turbot to $1"
  cd /sys/class/gpio
  echo 360 > export
  cd gpio360
  echo out > direction
  echo 1 > value
  cd ..
  echo 360 > unexport
else
  echo "$0: Not a MinnowBoard Turbot board"
fi

