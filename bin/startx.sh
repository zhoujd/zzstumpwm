#!/bin/sh

# select wm to run
wm_select="stumpwm"

case "$wm_select" in
    "stumpwm" )
        exec sbcl --eval '(ql:quickload :stumpwm)' \
                  --eval '(stumpwm:stumpwm)'
        ;;
    "clfswm" )
        exec sbcl --eval '(ql:quickload :clfswm)' \
                  --eval '(clfswm:main)'
        ;;
esac
