#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

BIN_TARGET=/usr/local/bin
sudo cp -fv $ZZSTUMPWM_ROOT/bin/zlock $BIN_TARGET/zlock

echo "setup zlock done"
