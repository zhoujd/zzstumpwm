#!/bin/sh

./configure --prefix=/usr --disable-perl
make

sudo make install
make distclean
