#!/bin/bash

## run as root:
#sudo ./gnome-dm-setup.sh

SETUP_ROOT=`pwd`

if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "[Desktop Entry]
Name=Stumpwm
Comment=Stumpwm window manager
TryExec=/usr/bin/gnome-session
Exec=$SETUP_ROOT/start-wm.sh
Type=XSession
" > /usr/share/xsessions/stumpwm.desktop
