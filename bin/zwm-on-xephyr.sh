#!/usr/bin/env bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
REZ=${REZ:-1280x720}
DSP=${DSP:-:100}

prepare() {
    REZ=${1:-$REZ}
    DSP=${2:-$DSP}
    Xephyr $DSP -ac -br -screen $REZ -resizeable &
}

run() {
    DSP=${1:-$DSP}
    DISPLAY=$DSP $ZWM_ROOT/bin/zwm-session
}

clean() {
    killall Xephyr >/dev/null 2>&1
}

usage() {
    prompt=$(basename $0)
    cat <<EOF
Usage:
$prompt {dep|prepare|run|clean|help|-h}
prepare {Resolution} {DISPLAY}
    Resolution   - 1280x720 (default)
    DISPLAY      - :100 (default)
    prepare 1280x720
    prepare 1280x720 :100
run {DISPLAY}
    DISPLAY      - :100 (default)
    run :100
EOF
}

case "$1" in
    "dep" )
        sudo apt install xserver-xephyr
        ;;
    "prepare" )
        shift
        prepare $@
        ;;
    "run" )
        shift
        run $@
        ;;        
    "clean" )
        clean
        ;;
    "-h" | "help" )
        usage
        ;;
    * )
        prepare
        sleep 2s
        run
        clean
        ;;
esac
