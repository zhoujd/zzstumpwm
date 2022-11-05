#!/bin/bash
#set -x -v

## https://wiki.archlinux.org/title/backlight

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
BRIGHT_PATH=/usr/bin/brightness-setup.sh
UDEV_RULES=/etc/udev/rules.d/90-backlight.rules

install_brightness() {
    echo "Install backlight udev rules"
    sudo ln -sfv $ZZSTUMPWM_ROOT/libexec/brightness-setup.sh $BRIGHT_PATH
}

install_auto() {
    echo "Install backlight $UDEV_RULES"
    sudo tee $UDEV_RULES <<EOF
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"
EOF
    echo "Please reboot"
    echo "Install auto done"
}

install_brightness
install_auto

echo "backlight_setup done"
