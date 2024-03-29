#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

install_gtk() {
    $ZWM_ROOT/bin/gtk2-setup.sh
    $ZWM_ROOT/bin/gtk3-setup.sh user
    $ZWM_ROOT/bin/gtk3-setup.sh cursor
}

install_zwmrc() {
    ln -sfvT $ZWM_ROOT/misc/.zwmrc ~/.zwmrc
    ln -sfvT $ZWM_ROOT/misc/.zwmrc.d ~/.zwmrc.d
}

install_gtk
install_zwmrc

echo "zwminit setup done"
