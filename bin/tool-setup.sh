#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

## Install mec/mew
TARGET=~/.local/bin
mkdir -p $TARGET

APPS=(
    busybox
    hexyl
    screen
    tmux
    tig
)
for app in ${APPS[@]}; do
    cp -vf $SCRIPT_ROOT/$app $TARGET
done
echo "Setup Tool done"
