#!/bin/bash

# vim /etc/lightdm/lightdm.conf.d/50-display-setup-script.conf
# [Seat:*]
# display-setup-script=add-and-set-resolution.sh eDP-1 1600 900 60

output="$1"
x="$2"
y="$3"
freq="$4"

if [ $# -ne 4 ]; then
echo "Usage: $0 output x y freq"
echo "To find output name: xrandr -q"
exit 0
fi

mode=$( cvt "$x" "$y" "$freq" | grep -v '^#' | cut -d' ' -f3- )
modename="${x}x${y}"

xrandr --newmode $modename $mode
xrandr --addmode "$output" "$modename"
xrandr --output "$output" --mode "$modename"

exit 0
