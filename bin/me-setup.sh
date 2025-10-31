#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
TOOL_ROOT=$ZWM_ROOT/third-party/MicroEMACS

## Install mec/mew
TARGET=~/.local/bin
mkdir -p $TARGET
cp -vf $TOOL_ROOT/{em,me,mg} $TARGET

echo "Setup MicroEMACS done"
