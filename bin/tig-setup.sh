#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

## Install mec/mew
TARGET=~/.local/bin
mkdir -p $TARGET
cp -vf $SCRIPT_ROOT/tig $TARGET

## Install tigrc configure
ln -sfvT $ZWM_ROOT/misc/.tigrc ~/.tigrc
ln -sfvT $ZWM_ROOT/misc/.tigrc.d ~/.tigrc.d

echo "Setup tig done"
