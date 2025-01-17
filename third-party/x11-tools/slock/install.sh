#!/bin/sh

clean() {
    make clean
    # clean config.h
    rm config.h

    echo "clean done"
}

build() {
    make
    chmod u+s slock

    echo "build done"
}

install() {
    sudo make install

    echo "install done"
}

clean
build
install
clean

echo "install slock ok ..."
