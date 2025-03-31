#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

## run as root:
if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "Setup zwm desktop"
sudo mkdir -p /usr/share/xsessions
tee /usr/share/xsessions/zwm.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=ZWM Session
Comment=Zach Window Manager
Exec=zwm-session
Icon=zwm
Type=Application
DesktopNames=ZWM
EOF

echo "Setup dwm dm done"
