#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
TARGET=/usr/local/bin

## Run as root
if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "Setup stumpwm-session"
cp -fv $SCRIPT_ROOT/stumpwm-session $TARGET/stumpwm-session

echo "Setup stumpwm desktop"
mkdir -p /usr/share/xsessions
tee /usr/share/xsessions/stumpwm.desktop <<EOF
[Desktop Entry]
Name=Stumpwm
Comment=Stumpwm window manager
Exec=stumpwm-session
Icon=stumpwm
Type=Application
DesktopNames=STUMPWM
EOF

echo "Setup stumpwm dm done"
