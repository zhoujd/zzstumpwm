#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
XPROFILE_PATH=~/.xprofile

## screen setup
if [ -x $XPROFILE_PATH ]; then
    $XPROFILE_PATH
    echo "screen setup done"
else
    echo "cannot find $XPROFILE_PATH"
fi
