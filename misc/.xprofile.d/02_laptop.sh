#!/bin/bash

## laptop multi-screen
laptop_screen() {
    local laptop="eDP-1"
    local laptop_flag=`xrandr | grep "^$laptop" | awk '{print $2}'`
    local ext="DP-1"
    local ext_flag=`xrandr | grep "^$ext" | awk '{print $2}'`
    local size="1920x1080"

    if [ "$laptop_flag" = "connected" ]; then
        xrandr --output $laptop --primary
    fi

    if [ "$ext_flag" = "connected" ]; then
        xrandr --addmode $ext $size
        xrandr --output $ext --same-as $laptop --mode $size
    fi
}

## laptop keyboard
laptop_keyboard() {
    local hyper_bin=$HOME/zzstumpwm/bin/hyper
    if [ -x $hyper_bin ]; then
        $hyper_bin laptop
    fi
}

## laptop touchpad
laptop_touchpad() {
    ## disable tap to click
    synclient TapButton1=0
}

laptop_screen
laptop_keyboard
laptop_touchpad
