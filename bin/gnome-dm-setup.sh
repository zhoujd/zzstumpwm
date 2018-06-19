#!/bin/bash

## run as root:
#sudo ./gnome-dm-setup.sh

CURRENT_DIR=`pwd`

if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "[Desktop Entry]
Name=Stumpwm
Comment=Stumpwm window manager
TryExec=/usr/bin/gnome-session
Exec=$CURRENT_DIR/startx.sh
Type=XSession
" > /usr/share/xsessions/stumpwm-1.desktop

echo "[Desktop Entry]
Name=Stumpwm
Comment=Stumpwm window manager
TryExec=gnome-shell
Exec=$CURRENT_DIR/startx.sh
Type=Application
DesktopNames=ubuntu:STUMPWM
X-Ubuntu-Gettext-Domain=gnome-session-3.0
" > /usr/share/xsessions/stumpwm-2.desktop
