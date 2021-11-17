#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

build() {
    echo "Build stumpwm start"
    if [ -z "$SBCL_HOME" ]; then
        export SBCL_HOME=/usr/lib/sbcl
    fi
    echo "Build and install stumpwm with SBCL_HOME: $SBCL_HOME"
    pushd $ZZSTUMPWM_ROOT/lisp/system/stumpwm
    ./autogen.sh
    ./configure --prefix=/usr
    make all
    sudo make install
    popd
    echo "Build stumpwm done"
}

build

echo "Build stumpwm done"

