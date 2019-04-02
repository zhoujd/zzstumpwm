#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

## turn off capslock
if [ "$(setcapslock get)" == "on" ]; then
    setcapslock off
    sleep 2
fi

case "$1" in
    "on" )
        echo "hyper-hyper key layout"
        xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/hyper.xmodmap
        sleep 2
        ;;
    "off" )
        echo "default key layout"
        xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/default.xmodmap
        ;;
    "laptop" )
        echo "hyper-super key layout"
        xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/hyper-super.xmodmap
        ;;
    * )
        echo "$(basename $0) {on|off|laptop}"
        ;;
esac
