#!/bin/bash

ECL_VERSION="16.1.3"
ECL_PKG="ecl-$ECL_VERSION.tgz"

https://common-lisp.net/project/ecl/static/files/release/ecl-16.1.3.tgz

echo "Download ECL $ECL_VERSION ...."

mkdir -p ~/Downloads

pushd ~/Downloads

## wget sbcl package
rm -f $ECL_PKG
wget https://common-lisp.net/project/ecl/static/files/release/$ECL_PKG

## untar package
tar xf $ECL_PKG

## install sbcl to default folder (/usr/local)
pushd ecl-$ECL_VERSION
./configure --prefix=/usr
make 
sudo make install
popd

popd

echo "Install ECL Done ..."
