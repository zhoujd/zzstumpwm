#!/bin/bash

# sudo apt-get install g++

echo "init build environment ..."
rm -rf build
mkdir -p build

echo "untar package ..."
tar xf rxvt-unicode.tar.bz2 -C build

pushd build/rxvt-unicode*

./configure --prefix=/usr --disable-perl --enable-xft
make
sudo make install

popd

echo "build rxvt-unicode ok ..."
