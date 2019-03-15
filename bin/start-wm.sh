#!/bin/sh

## Select window manager
## 1:stumpwm 2:clfswm
echo "You can also run : $0 [1|2]"
echo "1:stumpwm"
echo "2:clfswm"

## Here stumpwm is kept as default
WM_SELECT=${1:-1}

## Run .xprofile
## cp ~/zzstumpwm/misc/.xprofile ~
test -x ~/.xprofile && ~/.xprofile

## Start window manager
case "$WM_SELECT" in
    "1" )
        exec sbcl --eval '(ql:quickload :stumpwm)' \
                  --eval '(stumpwm:stumpwm)'
        ;;
    "2" )
        exec sbcl --eval '(ql:quickload :clfswm)' \
                  --eval '(clfswm:main)'
        ;;
esac
