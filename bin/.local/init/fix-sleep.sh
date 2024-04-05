#!/usr/bin/env bash

# echo 'deep' > /sys/power/mem_sleep
logger "fix-sleep mem sleep: $(cat /sys/power/mem_sleep)"

find /sys/bus/usb/devices/*/power/wakeup -exec sh -c "echo enabled > {}" \;

grep . /sys/bus/usb/devices/*/power/wakeup | while read -r line; do
  logger "fix-sleep usb wakeup: $line"
done