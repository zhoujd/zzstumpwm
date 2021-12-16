#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
PREFIX=/usr/local/stumpwm

build() {
    echo "Build stumpwm start"
    if [ -z "$SBCL_HOME" ]; then
        export SBCL_HOME=/usr/lib/sbcl
    fi
    echo "Build and install stumpwm with SBCL_HOME: $SBCL_HOME"
    pushd $ZZSTUMPWM_ROOT/lisp/system/stumpwm
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make all
    sudo make install
    popd
    echo "Build stumpwm done"
}

clean() {
    echo "Clean stumpwm start"
    pushd $ZZSTUMPWM_ROOT/lisp/system/stumpwm
    ./autogen.sh
    ./configure --prefix=$PREFIX
    sudo make uninstall
    popd
    echo "Clean stumpwm clean"
}

env() {
    echo "Set stumpwm env start"
    sudo tee /etc/profile.d/zz-stumpwm.sh <<EOF
export PATH=/usr/local/stumpwm/bin\${PATH:+:}\$PATH
EOF
    echo "Set stumpwm env done"
}

case $1 in
    build )
        build
        ;;
    clean )
        clean
        ;;
    env )
        env
        ;;
    * )
        echo "$(basename $0) {build|clean|env}"
        ;;
esac

echo "Build stumpwm done"
