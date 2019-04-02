#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

switch_xmodmap() {
    echo "switch to $1"
    setcapslock off
    xmodmap $1
    setcapslock off
}

case "$1" in
    "on" )
        switch_xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/hyper.xmodmap
        ;;
    "off" )
        switch_xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/default.xmodmap
        ;;
    "laptop" )
        switch_xmodmap $ZZSTUMPWM_ROOT/misc/.xmodmap/hyper-super.xmodmap
        ;;
    * )
        echo "$(basename $0) {on|off|laptop}"
        ;;
esac
