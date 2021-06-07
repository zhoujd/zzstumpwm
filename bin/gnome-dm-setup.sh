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
Exec=$SETUP_ROOT/zwm-session 1
Icon=
Type=Application
DesktopNames=STUMPWM
" > /usr/share/xsessions/stumpwm.desktop

echo "[Desktop Entry]
Name=clfswm
Comment=clfswm window manager
Exec=$SETUP_ROOT/zwm-session 2
Icon=
Type=Application
DesktopNames=CLFSWM
" > /usr/share/xsessions/clfswm.desktop
