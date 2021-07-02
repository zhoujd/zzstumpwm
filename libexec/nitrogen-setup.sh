#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

Install_nitrogen() {
    echo "Install nitrogen packages"
    sudo apt install -y nitrogen
}

Init_nitrogen() {
    echo "
Pleae Run 'nitrogen <directory>' to init
$ nitrogen ~/zzstumpwm/misc/.wallpaper/
"
}

Install_nitrogen
Init_nitrogen

echo "nitrogen setup done"
