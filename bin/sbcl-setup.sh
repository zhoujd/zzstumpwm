#!/bin/bash

SBCL_VERSION="1.4.6"
SBCL_PKG="sbcl-$SBCL_VERSION-x86-64-linux-binary.tar.bz2"

echo "Download SBCL $SBCL_VERSION ...."

mkdir -p ~/Downloads

pushd ~/Downloads

## wget sbcl package
if [ ! -f $SBCL_PKG ]; then
    wget http://prdownloads.sourceforge.net/sbcl/$SBCL_PKG
fi

## untar package
tar xf $SBCL_PKG

## remove old sbcl
#find /usr -name "sbcl*" | xargs sudo rm -rf

## install sbcl
pushd sbcl-$SBCL_VERSION-x86-64-linux
sudo INSTALL_ROOT=/usr/local sh install.sh
popd

popd

echo "Install SBCL Done ..."
