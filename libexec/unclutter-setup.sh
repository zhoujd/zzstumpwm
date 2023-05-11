#!/bin/bash

TARGET_ROOT=~/Downloads

dep() {
    sudo apt install -y libev-dev
}

install() {
    echo "Install unclutter"
    mkdir -p $TARGET_ROOT
    if [ ! -d $TARGET_ROOT/unclutter-xfixes ]; then
        git clone https://github.com/Airblader/unclutter-xfixes $TARGET_ROOT/unclutter-xfixes
    fi
    pushd $TARGET_ROOT/unclutter-xfixes
    make clean
    make unclutter
    sudo cp -f unclutter /usr/local/bin/
    popd
}

dep
install

echo "Install unclutter Done ..."
