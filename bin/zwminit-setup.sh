#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

install_zwmrc() {
    ln -sfvT $ZWM_ROOT/misc/.zwmrc ~/.zwmrc
    ln -sfvT $ZWM_ROOT/misc/.zwmrc.d ~/.zwmrc.d
}

install_zwmrc

echo "zwminit setup done"
