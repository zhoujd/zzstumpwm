#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
TARGET=/usr/bin/

install() {
    echo "install zwm"
    sudo ln -sfvT $SCRIPT_ROOT/zwm $TARGET/zwm
    sudo ln -sfvT $SCRIPT_ROOT/startzwm $TARGET/startzwm
}

uninstall() {
    echo "uninstall zwm"
    sudo rm -vf $TARGET/zwm
    sudo rm -vf $TARGET/startzwm
}

case $1 in
    install )
        install
        ;;
    uninstall )
        uninstall
        ;;
    * )
        echo "Usage $(basename $0) {install|uninstall}"
        ;;
esac

echo "zwm setup done"
