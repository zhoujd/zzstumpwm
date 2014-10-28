#!/bin/sh

#sudo yum install libX11-devel xorg-x11-server-devel

make -f Makefile.noimake
sudo make -f Makefile.noimake install

# clean temp file
rm -rf xtrlock xtrlock.o

echo "Install xtrlock finished ..."
