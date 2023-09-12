#!/usr/bin/env bash

Xephyr :100 -ac -screen 1280x680 &
XEPHYR_PID=$!
sleep 0.5

DISPLAY=:100 zwm-session
kill ${XEPHYR_PID}
