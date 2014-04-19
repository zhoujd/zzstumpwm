#!/bin/bash

# run as root:
# $ sudo bash ./gnome-dm-setup

CURRENT_DIR=`pwd`

if [ $EUID -ne 0 ]; then
  echo "You must be a root user" 2>&1
  exit 1
fi

echo "[Desktop Entry]
Name=GNOME with Stumpwm
Comment=Gnome with the Stumpwm window manager
TryExec=/usr/bin/gnome-session
Exec=$CURRENT_DIR/startx.sh
Type=XSession
" > /usr/share/xsessions/gnome-stumpwm.desktop
