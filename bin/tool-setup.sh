#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
TOOL_ROOT=$ZWM_ROOT/third-party/static-binaries/x86_64

## Install mec/mew
TARGET=~/.local/bin
mkdir -p $TARGET

APPS=(
    miniserve
    toybox
    delta
    hexyl
    rsync
    ctags
    tmux
    peco
    tig
    ag
    fd
)
for app in ${APPS[@]}; do
    cp -vf $TOOL_ROOT/$app $TARGET
done
echo "Setup Tool done"
