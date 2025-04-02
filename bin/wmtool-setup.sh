#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
TARGET=/usr/local/bin

install() {
    echo "install wm tool"
    sudo cp -fv $SCRIPT_ROOT/startwm $TARGET/startwm
    sudo cp -fv $SCRIPT_ROOT/killwm $TARGET/killwm
}

uninstall() {
    echo "uninstall wm tool"
    sudo rm -vf $TARGET/startwm
    sudo rm -vf $TARGET/killwm
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

echo "wmtool setup done"
