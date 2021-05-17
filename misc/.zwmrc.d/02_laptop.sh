#!/bin/bash

## laptop multi-screen
laptop_screen() {
    ##mirror ext monitor
    local laptop="eDP-1"
    local ext="DP-1"
    local flag=`xrandr | grep "^$ext" | awk '{print $2}'`
    local size="1920x1080"
    if [ "$flag" = "connected" ]; then
        xrandr --addmode $ext $size
        xrandr --output $ext --same-as $laptop --mode $size
    fi
}

## laptop keyboard
laptop_keyboard() {
    ##load Xmodmap for laptop
    test -f ~/.Xmodmap && xmodmap ~/.Xmodmap
}

## laptop touchpad
laptop_touchpad() {
    ##disable tap to click
    synclient TapButton1=0 >/dev/null 2>&1
}

laptop_screen
laptop_keyboard
laptop_touchpad
