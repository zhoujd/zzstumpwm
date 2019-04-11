#!/bin/bash

# Check for root user
if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

# Simple script to modify screen brightness
basedir="/sys/class/backlight/"

# get the backlight handler
handler=$basedir$(ls $basedir)"/"
chmod 666 $handler"brightness"
