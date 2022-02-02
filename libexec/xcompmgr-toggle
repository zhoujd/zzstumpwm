#!/bin/bash

if pgrep xcompmgr &>/dev/null; then
    echo "Turning xcompmgr OFF"
    pkill xcompmgr &
else
    echo "Turning xcompmgr ON"
    xcompmgr -C &
fi

exit 0
