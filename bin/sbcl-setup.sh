#!/bin/bash

SBCL_VERSION="2.0.1"
SBCL_PKG="sbcl-$SBCL_VERSION-x86-64-linux-binary.tar.bz2"
SBCL_PREFIX=/usr/local

## make sure the download folder exist
mkdir -p ~/Downloads

download() {
    echo "Download SBCL $SBCL_VERSION ...."
    pushd ~/Downloads
    ## wget sbcl package
    if [ ! -f $SBCL_PKG ]; then
        wget http://prdownloads.sourceforge.net/sbcl/$SBCL_PKG
    else
        echo "The $SBCL_PKG already be downloaded"
    fi
    popd
}

remove() {
    echo "Remove old SBCL"
    find /usr -name "sbcl*" | xargs sudo rm -rf
}

install() {
    echo "Install SBCL"
    pushd ~/Downloads
    if [ -f $SBCL_PKG ]; then
        ## untar package
        tar xf $SBCL_PKG
        ## install sbcl
        pushd sbcl-$SBCL_VERSION-x86-64-linux
        sudo INSTALL_ROOT=$SBCL_PREFIX sh install.sh
        popd
    else
        echo "Cannot find $SBCL_PKG, please download first"
    fi
    popd
}

case $1 in
    install )
        download
        install
        ;;
    download )
        download
        ;;
    remove )
        remove
        ;;
    * )
        echo "Usage: $(basename $0) {install|download|remove}"
        ;;
esac

echo "Install SBCL Done ..."
