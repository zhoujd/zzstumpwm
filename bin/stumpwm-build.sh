#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
PREFIX=/usr/local
SBCL_HOME=${SBCL_HOME:-/usr/lib/sbcl}

sbcl() {
    echo "build stumpwm"
    echo "use SBCL_HOME=$SBCL_HOME"
    pushd $ZZSTUMPWM_ROOT/lisp/system/stumpwm
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make all
    sudo make install
    popd
}

clisp() {
    echo "build stumpwm with clisp"
    pushd $ZZSTUMPWM_ROOT/lisp/system/stumpwm
    ./autogen.sh
    ./configure --prefix=$PREFIX --with-lisp=clisp
    make all
    sudo make install
    popd
}

clean() {
    echo "clean stumpwm"
    pushd $ZZSTUMPWM_ROOT/lisp/system/stumpwm
    git clean -dfx
    popd
}

case $1 in
    sbcl )
        sbcl
        ;;
    clisp )
        clisp
        ;;
    clean )
        clean
        ;;
    * )
        echo "Usage: $(basename $0) {sbcl|clisp|clean}"
        ;;
esac

echo "Build Stumpwm Done ..."
