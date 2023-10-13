#!/bin/bash
#set -x

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/../.. && pwd)
ZWM_DATA=/opt/zwm
ZWM_USER=$(id -u):$(id -g)

zwm_create() {
    sudo mkdir -p $ZWM_DATA
    sudo chown -R $ZWM_USER $ZWM_DATA
    echo "Prepare: $ZWM_DATA Create Done"
}

zwm_init() {
    pushd $ZWM_DATA > /dev/null
    mkdir -p .config .emacs.d .local .ssh .vscode
    popd > /dev/null
    echo "Prepare: Init Done"
}

zwm_create
zwm_init

echo "Prepare: All Done"
