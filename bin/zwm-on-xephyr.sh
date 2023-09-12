#!/usr/bin/env bash

Xephyr :100 -ac -screen 1920x1080 -resizeable &
XEPHYR_PID=$!
sleep 0.5

DISPLAY=:100 zwm-session
kill ${XEPHYR_PID}
