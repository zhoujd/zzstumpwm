#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

Install_mpv() {
    echo "Install mpv packages"
    sudo apt install -y mpv
}

Install_conf() {
    echo "Install mpv config"
    local target=~/.config/mpv
    mkdir -p $target
    cp -rdfv $ZZSTUMPWM_ROOT/misc/.config/mpv/* $target
}

Install_mpv
Install_conf

echo "mpv setup done"
