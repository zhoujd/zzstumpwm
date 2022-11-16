#!/bin/bash

echo "Usage: $(basename $0) {DP}
DP     defaut: eDP-1"

DP=${1:-eDP-1}
xrandr --output $DP --off

echo "Turn off $DP"
