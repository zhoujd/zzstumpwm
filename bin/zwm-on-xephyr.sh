#!/usr/bin/env bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

dep() {
    sudo apt install xserver-xephyr
}

xephyr() {
    local REZ=${1:-1280x720}
    local DSP=${2:-:100}
    
    Xephyr $DSP -ac -br -screen $REZ -resizeable &
    XEPHYR_PID=$!
    sleep 2s

    pushd $ZWM_ROOT
    DISPLAY=$DSP ./bin/zwm-session
    popd
    
    kill ${XEPHYR_PID}
}

usage() {
    prompt=$(basename $0)
    echo "
Usage:
$prompt {dep|help}
$prompt {Resulution} {DISPLAY}
$prompt 1280x720
$prompt 1280x720 :100
"
}

case "$1" in
    "dep" )
        dep
        ;;
    "help" | "-h" )
        usage
        ;;
    * )
        xephyr $@
        ;;
esac
