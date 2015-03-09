#!/bin/sh

## http://incise.org/tinywm.html

## sudo apt-get install libX11-dev
## sudo yum install libX11-devel
## sudo zypper install libX11-devel 

echo "compile tinywm ..."
gcc -o tinywm  tinywm.c -lX11
chmod +x tinywm

echo "setup tinywm to /usr/bin ..."
sudo cp tinywm /usr/bin

echo "clean temp file ..."
rm -rf tinywm

echo "build tinywm ok."
