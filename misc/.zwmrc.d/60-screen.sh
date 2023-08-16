#!/bin/bash
#set -x

screen() {
    local laptop="eDP-1"
    local ext="DP-1"
    local laptop_flag=$(xrandr | grep "^$laptop" | awk '{print $2}')
    local ext_flag=$(xrandr | grep "^$ext" | awk '{print $2}')
    local size="1920x1080"
    if [ "$ext_flag" = "connected" -a "$laptop_flag" = "connected" ]; then
        echo "[screen] mirror ext monitor"
        xrandr --addmode $ext $size
        xrandr --output $ext --same-as $laptop --mode $size
    fi
}

screen
