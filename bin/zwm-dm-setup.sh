#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
TARGET=/usr/local/bin

## Run as root
if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "Setup zwm-session"
cp -fv $SCRIPT_ROOT/zwm-session $TARGET/zwm-session

echo "Setup zwm desktop"
mkdir -p /usr/share/xsessions
tee /usr/share/xsessions/zwm.desktop <<EOF
[Desktop Entry]
Name=ZWM Session
Comment=Zach Window Manager
Exec=zwm-session
Icon=zwm
Type=Application
DesktopNames=ZWM
EOF

echo "Setup dwm dm done"
