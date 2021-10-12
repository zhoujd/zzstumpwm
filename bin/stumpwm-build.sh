#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
PREFIX=/usr/local/stumpwm

build() {
    echo "build stumpwm"
    pushd $ZZSTUMPWM_ROOT/lisp/system/stumpwm
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make all
    sudo make install
    popd
}

config() {
    echo "config stumpwm"
    sudo tee /etc/profile.d/zz-stumpwm.sh <<EOF
export PATH=/usr/local/stumpwm/bin${PATH:+:}$PATH
EOF
}

uninstall() {
    echo "uinstall stumpwm"
    sudo rm -f/etc/profile.d/zz-stumpwm.sh
    sudo rm -rf $PREFIX
}


case $1 in
    build )
        install
        ;;
    config )
        config
        ;;
    uninstall )
        uninstall
        ;;
    * )
        echo "Usage: $(basename $0) {install|config|uninstall}"
        ;;
esac

echo "Build Stumpwm Done ..."
