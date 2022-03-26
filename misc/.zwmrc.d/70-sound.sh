#!/bin/bash

speaker_init() {
    local defvol=0
    local speaker=$(pactl list short sinks | grep pci-0000 | cut -f 1)
    if [ -n $speaker ]; then
        echo "[sound] set speaker volume to $defvol and mute"
        pactl set-sink-volume $speaker $defvol
        pactl set-sink-mute $speaker off
    fi
}

headset_init() {
    local headset=$(pactl list short sinks | grep usb | cut -f 2)
    local defval=90%
    if [ -n $headset ]; then
        echo "[sound] set usb headset as default sink"
        pactl set-default-sink $headset
        pactl set-sink-volume $headset $defval
    fi
}

speaker_init
headset_init
