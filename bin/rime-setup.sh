#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

mkdir -p $TARGET
ln -sfvT $ZWM_ROOT/misc/.config/ibus/rime/default.custom.yaml $TARGET/ibus_rime.custom.yaml

echo "rime setup done"
