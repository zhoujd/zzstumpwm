#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
PREFIX=/usr/local/stumpwm

install() {
    echo "build stumpwm"
    if [ -n "$SBCL_HOME" ]; then
        echo "use SBCL_HOME=$SBCL_HOME"
        pushd $ZZSTUMPWM_ROOT/lisp/system/stumpwm
        ./autogen.sh
        ./configure --prefix=$PREFIX
        make all
        sudo make install
        popd
    else
        echo "not find SBCL_HOME in environment, please setup SBCL_HOME first"
        exit 1
    fi
}

clean() {
    echo "clean stumpwm"
    pushd $ZZSTUMPWM_ROOT/lisp/system/stumpwm
    git clean -dfx
    popd
}

config() {
    echo "config stumpwm"
    sudo tee /etc/profile.d/zz-stumpwm.sh <<EOF
export PATH=$PREFIX/bin\${PATH:+:}\$PATH
EOF
}

uninstall() {
    echo "uinstall stumpwm"
    sudo rm -f/etc/profile.d/zz-stumpwm.sh
    sudo rm -rf $PREFIX
}


case $1 in
    install )
        install
        ;;
    clean )
        clean
        ;;
    config )
        config
        ;;
    uninstall )
        uninstall
        ;;
    * )
        echo "Usage: $(basename $0) {install|clean|config|uninstall}"
        ;;
esac

echo "Build Stumpwm Done ..."
