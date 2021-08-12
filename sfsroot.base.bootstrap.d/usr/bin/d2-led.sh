#!/bin/bash

id=$(cat /sys/class/dmi/id/board_name 2>/dev/null)
if [[ "x$id" == "xMinnowBoard Turbot" ]]; then
  echo "$0: Setting D2 LED on MinnowBoard Turbot to off"
  # as of kernel 5.x
  gpioset 2 22=1
  # pre kernel 5.x
  #cd /sys/class/gpio
  #echo 360 > export
  #cd gpio360
  #echo out > direction
  #echo 1 > value
  #cd ..
  #echo 360 > unexport
else
  echo "$0: Not a MinnowBoard Turbot board"
fi

