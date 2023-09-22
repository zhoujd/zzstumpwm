#!/usr/bin/env bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
ZWM_REZ=${ZWM_REZ:-1280x720}
ZWM_DSP=${ZWM_DSP:-:110}

run() {
    REZ=${1:-$ZWM_REZ}
    DSP=${2:-$ZWM_DSP}

    XEPHYR_PARAM=(
        -ac
        -br
        -screen $REZ
        -resizeable
        -extension MIT-SHM
        -extension XTEST
        $DSP
    )

    Xephyr ${XEPHYR_PARAM[@]} &
    sleep 2s
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
$prompt run {Resolution} {DISPLAY}
        Resolution   - 1280x720 (default)
        DISPLAY      - :110 (default)
$prompt run 1280x720
$prompt run 1280x720 :110
EOF
}

case "$1" in
    "dep" )
        sudo apt install xserver-xephyr
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
