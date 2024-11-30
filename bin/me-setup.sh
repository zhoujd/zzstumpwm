#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

## Install mec/mew
TARGET=/usr/local/bin
sudo cp -v $SCRIPT_ROOT/mec $TARGET
sudo cp -v $SCRIPT_ROOT/mew $TARGET

## Install mec/mew configure
rm -rf ~/.config/jasspa
cp -rv $ZWM_ROOT/misc/.config/jasspa ~/.config

echo "Setup MicroEMACS done"
