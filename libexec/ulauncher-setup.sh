#!/bin/bash

## https://ulauncher.io/

version=5.11.0
Install_ulauncher() {
    local tmp=~/.tmp
    echo "Install ulauncher"
    mkdir -p $tmp
    pushd $tmp
    wget https://github.com/Ulauncher/Ulauncher/releases/download/${version}/ulauncher_${version}_all.deb
    sudo apt install ./ulauncher_${version}_all.deb
    popd
}

Install_ulauncher

echo "Install ulauncher Done ..."
