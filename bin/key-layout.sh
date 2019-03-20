#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

case "$1" in
    "default" )
        echo "default key layout"
        setcapslock off
        xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/default.xmodmap
        ;;
    "hyper" )
        echo "hyper key layout"
        setcapslock off
        xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/hyper.xmodmap
        ;;
    * )
        echo "$(basename $0) {default|hyper}"
        ;;
esac
