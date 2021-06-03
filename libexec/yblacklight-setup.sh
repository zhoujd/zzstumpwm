#!/bin/bash

install() {
    git clone https://github.com/szekelyszilv/ybacklight.git
    pushd  ybacklight/src
    sudo gcc ybacklight.c -o /usr/bin/ybacklight
    popd
}

clean() {
    echo "clean ybacklight"
    rm -rf ybacklight
}

install
clean

echo "yblacklight setup done"
