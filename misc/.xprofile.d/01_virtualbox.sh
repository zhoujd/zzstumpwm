#!/bin/bash

## Guest
## sudo pacman -S virtualbox-guest-utils
vbox_vm() {
    local vbox_util=VBoxClient-all
    if [ -x "$(command -v $vbox_util)" ]; then
        local full="1920x1080"
        local normal="1280x720"
        local screen=`xrandr | grep primary | awk '{print $1}'`
        local flag=`xrandr | grep primary | grep -c $full`

        if [ -z "$flag" ]; then
            xrandr --output $screen --mode "$normal"
        fi

        $vbox_util
    else
        echo "No $vbox_util"
    fi
}

vbox_vm
