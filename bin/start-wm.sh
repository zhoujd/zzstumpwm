#!/bin/sh

## Select window manager to run
## 1:stumpwm 2:clfswm
echo "You can also run : $0 [1|2]"
echo "1:stumpwm"
echo "2:clfswm"

## Here stumpwm is kept as default
WM_SELECT=${1:-1}

# cp ~/zzstumpwm/misc/.xprofile ~
if [ -x ~/.xprofile ]; then
    ~/.xprofile
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
