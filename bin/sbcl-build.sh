#!/bin/bash

##https://github.com/stumpwm/stumpwm/wiki/Compiling-SBCL
SBCL_PKG=~/Downloads/sbcl
SBCL_PREFIX=${HOME}/.zach/sbcl

## make sure the download folder exist
mkdir -p ~/Downloads

download() {
    echo "Download SBCL $SBCL_VERSION ...."
    mkdir -p ~/Downloads
    if [ ! -d $SBCL_PKG ]; then
        git clone git://git.code.sf.net/p/sbcl/sbcl $SBCL_PKG
    else
        echo "The $SBCL_PKG already be downloaded"
    fi
}

remove() {
    echo "Remove old SBCL"
    rm -rf $SBCL_PREFIX
}

install() {
    echo "Install SBCL"
    if [ -d $SBCL_PKG ]; then
        pushd $SBCL_PKG
        export -n SBCL_HOME
        sh make.sh --fancy --prefix=$SBCL_PREFIX
        sh install.sh --prefix=$SBCL_PREFIX
        popd
    else
        echo "Cannot find $SBCL_PKG, please download first"
    fi
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
