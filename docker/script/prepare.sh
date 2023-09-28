#!/bin/bash
#set -x

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/../.. && pwd)
ZWM_TOP=$(cd $ZWM_ROOT/.. && pwd)

dot_zwm(){
    mkdir -p $ZWM_TOP/.zwm
    pushd $ZWM_TOP/.zwm
    mkdir -p .config .emacs.d .local .ssh .vscode
    popd
    echo "Prepare .zwm Done"
}

dot_zwm

echo "Prepare All Done"
