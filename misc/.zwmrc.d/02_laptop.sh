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
    # gnome-settings-daemon that resets layouts when attach a new keyboard
    # sudo apt install dconf-cli
    dconf write /org/gnome/settings-daemon/plugins/keyboard/active false
    # load laptop keyboad map
    test -x /usr/bin/hyper && /usr/bin/hyper laptop
}

## laptop touchpad
laptop_touchpad() {
    # disable tap to click
    synclient TapButton1=0 >/dev/null 2>&1
}

laptop_screen
laptop_keyboard
laptop_touchpad