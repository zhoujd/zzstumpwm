#!/bin/bash

## https://github.com/stumpwm/stumpwm/wiki/Compiling-SBCL
## http://www.sbcl.org/getting.html
## sudo apt install libzstd-dev

SBCL_PKG=~/Downloads/sbcl
SBCL_PREFIX=/usr/local/sbcl
SBCL_VERSION=2.0.1
SBCL_ENV=/etc/profile.d/zz-sbcl.sh

## make sure the download folder exist
mkdir -p ~/Downloads

download() {
    echo "Download SBCL $SBCL_VERSION ...."
    mkdir -p ~/Downloads
    if [ ! -d $SBCL_PKG ]; then
        git clone https://github.com/sbcl/sbcl $SBCL_PKG && cd $SBCL_PKG
        git checkout -b zz/sbcl-${SBCL_VERSION} sbcl-${SBCL_VERSION}
    else
        echo "The $SBCL_PKG already be downloaded"
    fi
}

remove() {
    echo "Remove old SBCL"
    rm -rf $SBCL_PREFIX
    rm -f $SBCL_ENV
}

build() {
    local builder=${1:-clisp}  ## clisp or sbcl etc.
    echo "Install SBCL"
    if [ -d $SBCL_PKG ]; then
        pushd $SBCL_PKG
        export -n SBCL_HOME
        sh make.sh $builder --fancy --prefix=$SBCL_PREFIX
        sudo sh install.sh --prefix=$SBCL_PREFIX
        popd
    else
        echo "Cannot find $SBCL_PKG, please download first"
    fi
}

env() {
    echo "Set sbcl env start"
    sudo tee $SBCL_ENV <<EOF
export PATH=/usr/local/sbcl/bin\${PATH:+:}\$PATH
export SBCL_HOME=/usr/local/sbcl/lib/sbcl
EOF
    echo "Set sbcl env done"
}

case $1 in
    build|-b )
        shift
        download
        build $@
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
        echo "Usage: $(basename $0) {build|-b|download|remove|env}"
        ;;
esac

echo "Install SBCL Done ..."
