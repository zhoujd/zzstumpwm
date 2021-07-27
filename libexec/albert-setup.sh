#!/bin/bash

## https://software.opensuse.org/download.html?project=home:manuelschneid3r&package=albert
## $ albert 'Meta+Alt+;'

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

albert_install() {
    echo "Install albert"
    mkdir -p ~/Downloads
    pushd ~/Downloads
    wget https://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/amd64/albert_0.17.2-0_amd64.deb
    sudo apt install ./albert_0.17.2-0_amd64.deb
    rm -f albert_0.17.2-0_amd64.deb
    popd
}

albert_cfg() {
    echo "Install cfg"
    cp -vf $ZZSTUMPWM_ROOT/misc/.config/albert/albert.conf ~/.config/albert/
}

albert_install
albert_cfg


echo "albert setup done"
