#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

install() {
    echo "Install dunst packages"
    sudo apt install -y dunst

    echo "Install dunst config"
    mkdir -p ~/.config/dunst
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.config/dunst/dunstrc ~/.config/dunst/dunstrc
}

install

echo "dunst setup done"
