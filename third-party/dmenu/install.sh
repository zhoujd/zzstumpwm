#!/bin/sh

#sudo yum install libXinerama-develt libX11-devel xorg-x11-server-devel
#sudo apt-get install libxinerama-dev libx11-dev

make
sudo make install
make clean

echo "install dmenu finished ..."
