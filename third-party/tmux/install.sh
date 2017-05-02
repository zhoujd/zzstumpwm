#!/bin/bash

echo "build tmux start ..."

case "$1" in
    "ubuntu" )
        CONFIG_PARAM="--prefix=/usr"
        ;;
    "suse" )
        CONFIG_PARAM="--libdir=/usr/lib64"
        ;;
    "centos")
        CONFIG_PARAM="--libdir=/usr/lib64"
        ;;
    "fedora")
        CONFIG_PARAM="--libdir=/usr/lib64"
        ;;
    * )
        echo "Use $0 [ubuntu|suse|centos|fedora]"
        exit 1;
        ;;
esac

echo "install dependence ..."
./depends.sh $1

rm -rf build
mkdir build

echo "untar package ..."
tar xf libevent.tar.gz -C build
tar xf tmux.tar.gz -C build

echo "build libevent ..."
pushd build/libevent*

./configure $LIB_DIR
make 
sudo make install

popd

echo "build tmux ..."

pushd build/tmux*

./configure --prefix=/usr
make 
sudo make install

popd

rm -rf build

echo "build tmux end ..."
