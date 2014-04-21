#!/bin/bash

##ubuntu12.04 can work
##suse11 sp3 can work

# run as root:
# $ sudo bash ./gnome-dm-setup

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
" > /usr/share/xsessions/stumpwm.desktop
