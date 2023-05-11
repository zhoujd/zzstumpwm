#!/bin/bash

im_fcitx() {
    echo "[lang] fcitx as input method"
    export LANG=en_US.UTF-8    
    export GTK_IM_MODULE="fcitx"
    export QT_IM_MODULE="fcitx"
    export XMODIFIERS="@im=fcitx"
}

im_ibus() {
    echo "[lang] ibus as input method"
    export LANG=en_US.UTF-8
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
}

im_ibus
ibus-daemon -drx
