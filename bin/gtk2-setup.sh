#!/bin/bash

### Setting example for Numix or Tango
## ln -sf `pwd`/.gtkrc-2.0 ~
## apt search icon-theme
## sudo pacman -Ss icon-theme
## sudo apt install tango-icon-theme numix-icon-theme

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

install_gtkrc2() {
    echo "install gtkrc2"
    local target=~/.gtkrc-2.0
    rm -fv  $target
    ln -sfvT $SCRIPT_ROOT/misc/.gtkrc-2.0 $target
}

install_gtkrc2

echo "gtk2 setup done"
