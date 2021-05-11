#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
ZWMRC_PATH=$HOME/.zwmrc

install_zwmrc() {
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.zwmrc $HOME/.zwmrc
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.zwmrc.d $HOME/.zwmrc.d
}

install_zwmrc

echo "zwmrc_setup done"
