#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

### https://github.com/jonls/redshift
## $ sudo apt install intltool
## $ ./bootstrap
## $ automake --add-missing --copy --force-missing
## $ ./configure
## $ make
## $ sudo make install

Install_redshift() {
    echo "Install redshift packages"
    sudo apt install -y redshift
}

Install_cfg() {
    echo "Install redshift config"
    cp -fv $ZZSTUMPWM_ROOT/misc/.config/redshift.conf ~/.config/redshift.conf

    if [ -e /usr/bin/redshift ]; then
        ln -sfTv $ZZSTUMPWM_ROOT/misc/.config/systemd/user/redshift.service ~/.config/systemd/user/redshift.service
        systemctl daemon-reload --user
        systemctl --user enable --now redshift
        systemctl --user start --now redshift
        systemctl --user status redshift
        echo "redshift setup done"
    else
        echo "No redshift are found"
    fi
}

case $1 in
    install )
        Install_redshift
        ;;
    service )
        Install_cfg
        ;;
    * )
        echo "Usage: $(basename $0) {install|service}"
        ;;
esac
