#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

Install_hyper() {
    local bin_target=/usr/bin
    local bin_name=hyper
    echo "Install hyper to $BIN_TARGET"
    sudo ln -sfvT $ZZSTUMPWM_ROOT/bin/$bin_name $bin_target/$bin_name
}

Install_xmodmap() {
    echo "Install .Xmodmap.d to $HOME"
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.Xmodmap.d ~/.Xmodmap.d
    echo "Install laptop as default .Xmodmap"
    ln -sfvT ~/.Xmodmap.d/laptop.Xmodmap ~/.Xmodmap
}

Install_hyper
Install_xmodmap

echo "setup $BIN_TARGET/hyper done"
