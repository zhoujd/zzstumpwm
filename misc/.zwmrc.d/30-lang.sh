#!/bin/bash

im_ibus() {
    echo "[lang] ibus as input method"
    export LANG=en_US.UTF-8
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
}

def_im() {
    echo "[lang] eng as input method"
    ibus engine xkb:us::eng
}

im_ibus
def_im
