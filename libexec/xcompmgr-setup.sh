#!/bin/bash

install_pkg() {
    echo "install pkg"
    sudo apt install -y xcompmgr
}

## apt install xutils-dev
install_src() {
    mkdir -p ~/Downloads
    pushd ~/Downloads

    rm -frv compmgr
    echo "run git clone"
    git clone https://gitlab.freedesktop.org/xorg/app/xcompmgr

    echo "build xcompmgr"
    pushd  xcompmgr
    ./autogen.sh
    make
    echo "install xcompmgr"
    sudo make install
    popd

    popd
}

case $1 in
    pkg )
        install_pkg
        ;;
    src )
        install_src
        ;;
    * )
        echo "Usage: $(basename $0) {pkg|src}"
        ;;
esac

echo "Install xcompmgr Done ..."
