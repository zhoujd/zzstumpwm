#!/bin/bash
#set -x

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/../.. && pwd)
ZWM_TOP=$(cd $ZWM_ROOT/.. && pwd)

mkdir -p $ZWM_TOP/.zwm

pushd $ZWM_TOP/.zwm
mkdir -p .config .emacs.d .local .ssh
popd

echo "Prepare Done"
