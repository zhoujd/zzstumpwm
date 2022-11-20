#!/bin/bash

## https://github.com/stumpwm/stumpwm/wiki/Compiling-SBCL
## sudo apt install libzstd-dev

SBCL_PKG=~/Downloads/sbcl
SBCL_PREFIX=/usr/local/sbcl

## make sure the download folder exist
mkdir -p ~/Downloads

download() {
    echo "Download SBCL $SBCL_VERSION ...."
    mkdir -p ~/Downloads
    if [ ! -d $SBCL_PKG ]; then
        git clone https://github.com/sbcl/sbcl $SBCL_PKG
    else
        echo "The $SBCL_PKG already be downloaded"
    fi
}

remove() {
    echo "Remove old SBCL"
    rm -rf $SBCL_PREFIX
    rm -f /etc/profile.d/zz-sbcl.sh
}

install() {
    echo "Install SBCL"
    if [ -d $SBCL_PKG ]; then
        pushd $SBCL_PKG
        export -n SBCL_HOME
        sh make.sh --fancy --prefix=$SBCL_PREFIX
        sudo sh install.sh --prefix=$SBCL_PREFIX
        popd
    else
        echo "Cannot find $SBCL_PKG, please download first"
    fi
}

env() {
    echo "Set sbcl env start"
    sudo tee /etc/profile.d/zz-sbcl.sh <<EOF
export PATH=/usr/local/sbcl/bin\${PATH:+:}\$PATH
export SBCL_HOME=/usr/local/sbcl
EOF
    echo "Set sbcl env done"
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
    env )
        env
        ;;
    * )
        echo "Usage: $(basename $0) {install|download|remove|env}"
        ;;
esac

echo "Install SBCL Done ..."
