#!/bin/bash

monitors() {
    local laptop="eDP-1"
    local ext="DP-1"
    local laptop_flag=$(xrandr | grep "^$laptop" | awk '{print $2}')
    local ext_flag=$(xrandr | grep "^$ext" | awk '{print $2}')
    local size="1920x1080"
    if [ "$ext_flag" = "connected" -a "$laptop_flag" = "connected" ]; then
        echo "$(date) [screen] setup mirror ext monitor"
        xrandr --addmode $ext $size
        xrandr --output $ext --same-as $laptop --mode $size
    fi
}

vm() {
    local disp=Virtual1
    local size=1440x900
    xrandr --output $disp --primary --mode $size
}

displays() {
    xrandr -q | awk '($2 == "connected") {print $1;}'
}

screen() {
    case $(displays) in
        Virtual1 )
            echo "$(date) [screen] setup VM display"
            vm
            ;;
        eDP-1 )
            echo "$(date) [screen] setup laptop display"
            monitors
            ;;
        * )
            echo "$(date) [screen] Unknow display"
            ;;
    esac
}
