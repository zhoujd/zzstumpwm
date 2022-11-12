#!/bin/bash

speaker_init() {
    local defvol=0
    local speaker_list=$(pactl list short sinks | grep pci-0000 | cut -f 1)
    for speaker in $speaker_list; do
        if [ -n "$speaker" ]; then
            echo "[sound] set speaker $speaker volume to $defvol and mute"
            pactl set-sink-volume $speaker $defvol
            pactl set-sink-mute $speaker off
        fi
    done
}

headset_init() {
    local defvol=50%
    local headset_list=$(pactl list short sinks | grep usb | cut -f 2)
    for headset in $headset_list; do
        if [ -n "$headset" ]; then
            echo "[sound] set usb headset as default sink"
            pactl set-default-sink $headset
            pactl set-sink-volume $headset $defvol
        fi
    done
}

speaker_init
headset_init
