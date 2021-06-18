#!/bin/bash

## https://software.opensuse.org/download.html?project=home:manuelschneid3r&package=albert

albert_install() {
    mkdir -p ~/Downloads
    pushd ~/Downloads
    wget https://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/amd64/albert_0.17.2-0_amd64.deb
    sudo apt install ./albert_0.17.2-0_amd64.deb
    rm -f albert_0.17.2-0_amd64.deb
    popd
}

albert_install

echo "albert setup done"

