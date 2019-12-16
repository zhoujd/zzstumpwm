#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

BIN_TARGET=/usr/bin
sudo ln -sfv $ZZSTUMPWM_ROOT/bin/hyper $BIN_TARGET

echo "setup $BIN_TARGET/hyper done"
