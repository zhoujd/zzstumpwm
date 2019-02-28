#!/bin/bash

## run as root:
#sudo ./light-dm-setup.sh

SETUP_ROOT=`pwd`

if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "[Desktop Entry]
Version=1.0
Name=Stumpwm
Comment=Stumpwm window manager
Exec=$SETUP_ROOT/start-wm.sh
Icon=
Type=Application
DesktopNames=STUMPWM
" > /usr/share/xsessions/stumpwm.desktop
