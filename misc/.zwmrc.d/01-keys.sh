#!/bin/bash

keys() {
    echo "[keys] nocaps"
    setxkbmap -option 'ctrl:nocaps'

    echo "[keys] map 'Caps Lock' as both 'Shift' at same time"
    setxkbmap -option "shift:both_capslock"
}
