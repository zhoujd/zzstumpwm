#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

Install_redshift() {
    echo "Install redshift packages"
    sudo apt install -y redshift
}

Install_cfg() {
    echo "Install redshift config"
    cp -fv $ZZSTUMPWM_ROOT/misc/.config/redshift.conf ~/.config/
}


Install_cfg
Install_redshift

echo "redshift setup done"
