#!/bin/sh

session=${1:-stumpwm}

case $session in
    stumpwm )
        exec sbcl --eval '(ql:quickload :stumpwm)' \
                  --eval '(stumpwm:stumpwm)'
        ;;
    sawfish )
        exec sawfish
        ;;
    * )
        exec $1
esac
