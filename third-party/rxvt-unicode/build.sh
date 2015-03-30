#!/bin/sh

echo "init build environment ..."
rm -rf build
mkdir -p build

echo "untar package ..."
tar xf rxvt-unicode.tar.bz2 -C build

pushd build/rxvt-unicode*

./configure --prefix=/usr --disable-perl
make
sudo make install

popd

echo "build rxvt-unicode ok ..."
