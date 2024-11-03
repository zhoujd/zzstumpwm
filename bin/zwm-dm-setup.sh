#!/bin/bash

## run as root:
#sudo ./zwm-dm-setup.sh

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "Setup zwm desktop"
tee /usr/share/xsessions/zwm.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=ZWM Session
Comment=Runs the Zach Window Manager
Exec=/etc/X11/Xsession
Icon=
Type=Application
DesktopNames=ZWM
EOF

echo "Setup dwm dm done"
