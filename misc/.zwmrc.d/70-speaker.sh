#!/bin/bash

speaker_init() {
    local defvol=0
    local speaker=$(pactl list short sinks | cut -f 2 | grep pci-0000)
    if [ -n $speaker ]; then
        echo "[speaker] set volume to $defvol and mute"
        pactl set-sink-volume $speaker $defvol
        pactl set-sink-mute $speaker off
    fi
}

speaker_init
