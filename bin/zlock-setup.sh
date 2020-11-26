#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

BIN_TARGET=/usr/bin
sudo ln -sfvT $ZZSTUMPWM_ROOT/bin/zlock $BIN_TARGET/zlock

ICON_TARGET=~/.icons
mkdir -p $ICON_TARGET
cp -vf $ZZSTUMPWM_ROOT/misc/.icons/lock.png $ICON_TARGET

echo "setup zlock done"
