#!/bin/bash

xcompmgr_install() {
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

xcompmgr_install

echo "Install xcompmgr Done ..."
