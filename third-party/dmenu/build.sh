#!/bin/sh

#sudo yum install libXinerama-devel libX11-devel xorg-x11-server-devel

make
sudo make install
make clean

echo "install dmenu finished ..."
