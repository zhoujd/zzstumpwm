#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
XMODMAP_ROOT=$ZZSTUMPWM_ROOT/misc/.xmodmap

switch_xmodmap() {
    echo "switch to $1"
    setcapslock off
    xmodmap $1
    setcapslock off
}

case "$1" in
    "default" )
        switch_xmodmap $XMODMAP_ROOT/default.xmodmap
        ;;
    "hyper" )
        switch_xmodmap $XMODMAP_ROOT/hyper.xmodmap
        ;;
    "laptop" )
        switch_xmodmap $XMODMAP_ROOT/laptop.xmodmap
        ;;
    * )
        echo "Usage: $(basename $0) {default|hyper|laptop}"
        ;;
esac
