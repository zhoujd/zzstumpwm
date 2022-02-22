#!/bin/bash

screen() {
    local laptop="eDP-1"
    local ext="DP-1"
    local flag=`xrandr | grep "^$ext" | awk '{print $2}'`
    local size="1920x1080"
    if [ "$flag" = "connected" ]; then
        echo "[screen] mirror ext monitor"
        xrandr --addmode $ext $size
        xrandr --output $ext --same-as $laptop --mode $size
    fi
}

screen
