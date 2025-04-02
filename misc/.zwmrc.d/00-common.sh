#!/bin/bash

common() {
    echo "$(date) [common] load X resource"
    [ -f ~/.Xresources ] && xrdb -load ~/.Xresources

    echo "$(date) [common] load X modmap"
    [ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
}
