#!/bin/bash

## http://www.sbcl.org/getting.html

SBCL_VERSION="2.0.1"
SBCL_PKG="sbcl-$SBCL_VERSION-x86-64-linux-binary.tar.bz2"
SBCL_PREFIX=/usr/local/sbcl

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

uninstall() {
    echo "Uninstall SBCL"
    sudo rm -rf $SBCL_PREFIX
    sudo rm /etc/profile.d/zz-sbcl.sh
}

config() {
    echo "Install config"
    sudo tee /etc/profile.d/zz-sbcl.sh <<EOF
export SBCL_HOME=$SBCL_PREFIX/lib/sbcl
export PATH=$SBCL_PREFIX/bin\${PATH:+:}\$PATH
EOF
}

case $1 in
    install )
        download
        install
        config
        ;;
    download )
        download
        ;;
    remove )
        remove
        ;;
    uninstall )
        uninstall
        ;;
    config )
        config
        ;;
    * )
        echo "Usage: $(basename $0) {install|download|remove|uninstall|config}"
        ;;
esac

echo "Install SBCL Done ..."
