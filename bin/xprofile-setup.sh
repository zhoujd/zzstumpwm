#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
ZZXPROFILE_PATH=/usr/bin/zzxprofile

install_zzxprofile() {
    sudo ln -sf $ZZSTUMPWM_ROOT/misc/.xprofile $ZZXPROFILE_PATH
}

install_zzxprofile

echo "xprofile_setup done"
