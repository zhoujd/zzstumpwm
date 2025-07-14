#!/bin/bash

TARGET=~/Downloads

install() {
    mkdir -p $TARGET
    rm -rf $TARGET/ybacklight
    git clone https://github.com/szekelyszilv/ybacklight.git $TARGET/ybacklight
    if [ -d $TARGET/ybacklight ]; then
        pushd  $TARGET/ybacklight/src
        echo "Build ybacklight"
        sudo gcc ybacklight.c -o /usr/local/bin/ybacklight
        echo "Non-root user to control backlight"
        sudo sudo gpasswd video -a $USER
        popd
    else
        echo "No $TARGET/ybacklight folder"
    fi
}

clean() {
    echo "clean $TARGET/ybacklight"
    rm -rf $TARGET/ybacklight
}

install
clean

echo "yblacklight setup done"
