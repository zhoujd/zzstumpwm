#!/bin/bash

touchpad() {
    if [ -n "$(xinput list | grep -i touchpad)" ]; then
        echo "$(date) [touchpad] disable tap to click"
        synclient TapButton1=0
    fi           
}
