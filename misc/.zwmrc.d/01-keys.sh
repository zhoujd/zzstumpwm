#!/bin/bash

keys() {
    echo "$(date) [keys] nocaps"
    setxkbmap -option 'ctrl:nocaps'

    echo "$(date) [keys] map 'Caps Lock' as both 'Shift' at same time"
    setxkbmap -option "shift:both_capslock"
}
