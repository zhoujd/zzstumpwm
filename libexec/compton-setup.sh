#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

Install_compton() {
    echo "Install compton packages"
    sudo apt install -y compton compton-conf

    echo "Install compton config"
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.config/compton.conf ~/.config/
}

Install_compton

echo "compton setup done"
