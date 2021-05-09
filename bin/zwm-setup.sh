#!/bin/bash

## run as root:
#sudo ./zwm-setup.sh

SETUP_ROOT=`pwd`

if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "[Desktop Entry]
Encoding=UTF-8
Name=ZWM xsession
Comment=Runs the Zach Window Manager
Exec=/etc/X11/Xsession
Type=Application
" > /usr/share/xsessions/zwm.desktop
