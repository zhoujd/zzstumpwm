#!/bin/bash

##ubuntu12.04 can work
##suse11 sp3 can work
##centos6.5 can work

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
TryExec=gnome-shell
Exec=$CURRENT_DIR/startx.sh
Type=Application
DesktopNames=ubuntu:STUMPWM
X-Ubuntu-Gettext-Domain=gnome-session-3.0
" > /usr/share/xsessions/stumpwm.desktop
