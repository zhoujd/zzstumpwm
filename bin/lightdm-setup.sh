#!/bin/bash

## run as root:
#sudo ./lightdm-setup.sh

if [ $EUID -ne 0 ]; then
    echo "You must be a root user" 2>&1
    exit 1
fi

echo "[Desktop Entry]
Name=Stumpwm
Comment=Stumpwm window manager
Exec=stumpwm
Icon=
Type=Application
DesktopNames=STUMPWM
" > /usr/share/xsessions/stumpwm.desktop
