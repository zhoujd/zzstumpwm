#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

mkdir -p ~/.config/ibus/rime
ln -sfvT $ZWM_ROOT/misc/.config/ibus/rime/default.custom.yaml ~/.config/ibus/rime/default.custom.yaml

echo "rime setup done"
