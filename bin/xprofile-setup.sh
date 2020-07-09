#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
XPROFILE_PATH=/usr/bin/xprofile

install_xprofile() {
    sudo ln -sfv $ZZSTUMPWM_ROOT/misc/.xprofile $XPROFILE_PATH
}

install_xprofile

echo "xprofile_setup done"
