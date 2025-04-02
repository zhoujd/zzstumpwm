#!/bin/bash

im_fcitx() {
    echo "$(date) [lang] fcitx as input method"
    export LANG=en_US.UTF-8    
    export GTK_IM_MODULE="fcitx"
    export QT_IM_MODULE="fcitx"
    export XMODIFIERS="@im=fcitx"

    fcitx -d
}

im_ibus() {
    echo "$(date) [lang] ibus as input method"
    export LANG=en_US.UTF-8
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus

    ibus-daemon -drx
}

lang() {
    im_ibus
}
