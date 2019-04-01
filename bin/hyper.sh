#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

case "$1" in
    "on" )
        echo "hyper-hyper key layout"
        setcapslock off
        xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/hyper.xmodmap
        ;;
    "off" )
        echo "default key layout"
        setcapslock off
        xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/default.xmodmap
        ;;
    "laptop" )
        echo "hyper-super key layout"
        setcapslock off
        xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/hyper-super.xmodmap
        ;;
    * )
        echo "$(basename $0) {on|off|laptop}"
        ;;
esac
