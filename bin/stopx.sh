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
        kill -TERM `ps -ef | grep stumpwm | grep -v grep | awk '{print $2}'`
        ;;
    "2" )
        kill -TERM `ps -ef | grep clfswm | grep -v grep | awk '{print $2}'`
        ;;
esac
