#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
XPROFILE_PATH=~/.xprofile

## reload multi-screen setting
if [ -x $XPROFILE_PATH ]; then
    $XPROFILE_PATH
    echo "multi-screen setup done"
else
    echo "cannot find $XPROFILE_PATH"
fi
