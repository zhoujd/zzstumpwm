#!/bin/sh

# Select window manager to run
# 1:stumpwm 2:clfswm
WM_SELECT="1"

echo "You can also run : $0 [1|2]"
echo "1:stumpwm"
echo "2:clfswm"

if [ ! "" = "$1" ]; then
    WM_SELECT=$1
fi

case "$WM_SELECT" in
    "1" )
        exec sbcl --eval '(ql:quickload :stumpwm)' \
                  --eval '(stumpwm:stumpwm)'
        ;;
    "2" )
	    # https://trac.common-lisp.net/clfswm/wiki
        exec sbcl --eval '(ql:quickload :clfswm)' \
                  --eval '(clfswm:main)'
        ;;
esac
