#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

Install_redshift() {
    echo "Install redshift packages"
    sudo apt install -y redshift

    echo "Install redshift config"
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.config/redshift ~/.config/redshift
}

Install_redshift

echo "redshift setup done"
