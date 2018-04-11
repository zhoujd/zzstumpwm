#!/bin/bash

SBCL_VERSION="1.4.6"
SBCL_PKG="sbcl-$SBCL_VERSION-x86-64-linux-binary.tar.bz2"

echo "Download SBCL $SBCL_VERSION ...."

pushd ~/Downloads/

## wget sbcl package
rm -f $SBCL_PKG
wget http://prdownloads.sourceforge.net/sbcl/$SBCL_PKG

## untar package
tar xf $SBCL_PKG

## install sbcl to default folder (/usr/local)
pushd sbcl-$SBCL_VERSION-x86-64-linux
sudo sh install.sh
popd

popd

echo "Install SBCL Done ..."
