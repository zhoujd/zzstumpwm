#!/usr/bin/env bash


dep() {
    sudo apt install xserver-xephyr
}

xephyr() {
    local REZ=${1:-1280x720}
    local DSP=${2:-:100}
    Xephyr $DSP -ac -screen $REZ -resizeable &
    XEPHYR_PID=$!
    sleep 0.5

    DISPLAY=$DSP zwm-session
    kill -9 ${XEPHYR_PID}
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
