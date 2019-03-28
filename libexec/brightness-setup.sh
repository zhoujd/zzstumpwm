#!/bin/bash

# Simple script to modify screen brightness
basedir="/sys/class/backlight/"

# get the backlight handler
handler=$basedir$(ls $basedir)"/"
sudo chmod 666 $handler"brightness"
