#!/bin/sh

make
chmod u+s slock

sudo make install
make clean

# clean config.h
rm config.h

echo "install slock ok ..."
