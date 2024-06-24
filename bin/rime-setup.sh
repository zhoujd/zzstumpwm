#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

TARGET=~/.config/ibus/rime/ibus_rime.custom.yaml
ln -sfvT $ZWM_ROOT/misc/.config/ibus/rime/default.custom.yaml $TARGET

echo "rime setup done"
