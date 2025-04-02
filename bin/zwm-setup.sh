#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
TARGET=/usr/local/bin

install() {
    echo "install zwm"
    sudo cp -fv $SCRIPT_ROOT/startwm $TARGET/startwm
}

uninstall() {
    echo "uninstall zwm"
    sudo rm -vf $TARGET/startwm
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
