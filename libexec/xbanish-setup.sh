#!/bin/bash

TARGET_ROOT=~/Downloads

dep() {
    sudo apt install -y libxfixes-dev libxi-dev libxext-dev
}

install() {
    echo "Install xbanish"
    mkdir -p $TARGET_ROOT
    if [ ! -d $TARGET_ROOT/xbanish ]; then
        git clone https://github.com/jcs/xbanish $TARGET_ROOT/xbanish
    fi
    pushd $TARGET_ROOT/xbanish
    make clean
    make
    sudo make install
    popd
}

dep
install

echo "Install xbanish Done ..."
