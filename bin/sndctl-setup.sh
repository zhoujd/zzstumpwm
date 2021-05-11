#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

BIN_TARGET=/usr/bin/sndctl
sudo ln -sfvT $ZZSTUMPWM_ROOT/bin/sndctl $BIN_TARGET

echo "setup $BIN_TARGET done"
