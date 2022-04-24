#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
NNN_TGT=~/Downloads/nnn

install() {
    echo "install nnn packages"
    if [ -d $NNN_TGT ]; then
        echo "The folder $NNN_TGT already there"
    else
        mkdir -p ~/Downloads/
        git clone https://github.com/jarun/nnn $NNN_TGT
        pushd $NNN_TGT
        make
        sudo make install
        popd
    fi
}

config() {
    echo "config nnn"
    sudo tee /etc/profile.d/zz-nnn.sh <<EOF
### zz-nnn.sh

export NNN_BMS='d:~/Downloads/;w:~/work/;/:/;z:/zach/'
export NNN_SSHFS='sshfs -o follow_symlinks'
export NNN_TRASH=1
export NNN_FIFO='/tmp/nnn.fifo'
EOF
    echo "Init NNN Done, please reboot or re-login"
}

clean() {
    echo "clean nnn"    
    rm -rf $NNN_TGT
}

case $1 in
    install )
        install
        ;;
    config )
        config
        ;;
    clean )
        clean
        ;;
    * )
        echo "Usage: $(basename $0) {install|config|clean}"
        ;;
esac
