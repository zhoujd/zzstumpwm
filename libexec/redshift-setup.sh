#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

### https://github.com/jonls/redshift
## $ sudo apt install intltool
## $ ./bootstrap
## $ automake --add-missing --copy --force-missing
## $ ./configure --prefix=/usr
## $ make
## $ sudo make install

Install_deps() {
    echo "Install redshift packages"
    sudo apt install -y redshift
}

Install_cfg() {
    cp -fv $ZZSTUMPWM_ROOT/misc/.config/redshift.conf ~/.config/redshift.conf
    echo "Install redshift config done"
}

Install_service() {
    if [ -e /usr/bin/redshift ]; then
        mkdir -p $ZZSTUMPWM_ROOT/misc/.config/systemd/user
        ln -sfTv $ZZSTUMPWM_ROOT/misc/.config/systemd/user/redshift.service ~/.config/systemd/user/redshift.service
        systemctl daemon-reload --user
        systemctl --user enable --now redshift
        systemctl --user start --now redshift
        systemctl --user status redshift
        echo "Install redshift service done"
    else
        echo "No redshift are found"
    fi
}

case $1 in
    deps )
        Install_deps
        ;;
    service )
        Install_cfg
        Install_service
        ;;
    status )
        systemctl --user  status redshift
        ;;
    * )
        echo "Usage: $(basename $0) {deps|service|status}"
        ;;
esac
