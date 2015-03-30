#!/bin/sh

#sudo yum install libX11-devel xorg-x11-server-devel

# compile
make -f Makefile.noimake

# install
sudo make -f Makefile.noimake install

# none root user using it
sudo chmod u+s /usr/bin/xtrlock

# clean temp file
rm -rf xtrlock xtrlock.o

echo "Install xtrlock finished ..."
