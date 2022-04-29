#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
NNN_TGT=~/Downloads/nnn

## https://github.com/jarun/nnn/wiki/Usage

deps() {
    echo "install dependences"
    sudo apt install -y pkg-config libncursesw5-dev libreadline-dev
}

install() {
    echo "install nnn packages"
    if [ -d $NNN_TGT ]; then
        echo "The folder $NNN_TGT already there"
    else
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

export NNN_BMS='d:~/Downloads/;t:~/.local/share/Trash/files/;w:~/work/;z:/zach/;/:/;~:~/'
export NNN_OPTS='e'
export NNN_SSHFS='sshfs -o follow_symlinks'
export NNN_TRASH=1
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_PLUG='e:!emacsclient $nnn;x:!chmod +x $nnn;g:!git log;R:!rm -ri $nnn'
EOF
    echo "Init NNN Done, please reboot or re-login"
}

clean() {
    echo "clean nnn"    
    rm -rf $NNN_TGT
}

case $1 in
    deps )
        deps
        ;;
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
        echo "Usage: $(basename $0) {deps|install|config|clean}"
        ;;
esac
