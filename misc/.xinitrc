#!/bin/sh


case "$1" in
    "sawfish")
        exec sawfish
        ;;
    *)
        exec sbcl --eval '(ql:quickload :stumpwm)' \
                  --eval '(ql:quickload :swank)'   \
                  --eval '(stumpwm:stumpwm)'
        ;;
esac
