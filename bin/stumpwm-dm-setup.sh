#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
TARGET=/usr/bin

## Please run as root
if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "Setup stumpwm-session"
ln -sfvT $SCRIPT_ROOT/stumpwm-session $TARGET/stumpwm-session

echo "Setup stumpwm desktop"
tee /usr/share/xsessions/stumpwm.desktop <<EOF
[Desktop Entry]
Name=Stumpwm
Comment=Stumpwm window manager
Exec=stumpwm-session
Icon=
Type=Application
DesktopNames=STUMPWM
EOF

echo "Setup stumpwm dm done"
