#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
MISC_HOME=$(cd $SCRIPT_ROOT/../misc && pwd)

## setup .xinitrc
cp $MISC_HOME/.xinitrc ~/.xinitrc 

## setup .profile or .bash_profile
cat <<EOF >> ~/.bash_profile

# auto startx on tty1
WM_NAME="stumpwm"
if [ "\$(tty)" = "/dev/tty1" ]; then
    WM_PID=\`ps -ef | grep \$WM_NAME | grep -v grep | awk '{print \$2}'\`
    if [ -z "\$WM_PID" ]; then
        startx
    fi
fi
EOF

echo "xinit-setup done ..."
