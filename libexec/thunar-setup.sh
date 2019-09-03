#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

echo "Install icons ..."
sudo apt install tango-icon-theme numix-icon-theme

echo "Setup gtk conf ..."
rm -f ~/.gtkrc-2.0
ln -sf $ZZSTUMPWM_ROOT/misc/.gtkrc-2.0 ~/.gtkrc-2.0

echo "Thunar setup done ..."
