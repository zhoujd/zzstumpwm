#!/bin/bash

## run as root:
#sudo ./lightdm-setup.sh

SETUP_ROOT=`pwd`

if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "[Desktop Entry]
Name=Stumpwm
Comment=Stumpwm window manager
Exec=$SETUP_ROOT/zwm-session
Icon=
Type=Application
DesktopNames=STUMPWM
" > /usr/share/xsessions/stumpwm.desktop
