#!/usr/bin/env bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
REZ=${REZ:-1280x720}
DSP=${DSP:-:100}

usage() {
    prompt=$(basename $0)
    echo "
Usage:
$prompt {depend|prepare|run|clean|help}
$prompt {Resulution} {DISPLAY}
$prompt 1280x720
$prompt 1280x720 :100
"
}

case "$1" in
    "depend" )
        sudo apt install xserver-xephyr
        ;;
    "prepare" )
        shift
        REZ=${1:-$REZ}
        DSP=${2:-$DSP}
        Xephyr $DSP -ac -br -screen $REZ -resizeable &
        ;;
    "run" )
        pushd $ZWM_ROOT
        DISPLAY=$DSP ./bin/zwm-session
        popd
        ;;        
    "clean" )
        killall Xephyr
        ;;
    * )
        usage
        ;;
esac
