#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

TARGET=/usr/local/bin
sudo cp -fv $ZWM_ROOT/bin/sndctl $BIN_TARGET

echo "setup sndctl done"
