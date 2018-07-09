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

kill_wm()
{
    wm_pid=`ps -ef | grep $1 | grep -v grep | awk '{print $2}'`
    if [ ! "" = "$wm_pid" ]; then
        kill -TERM $wm_pid
    fi 
}

case "$WM_SELECT" in
    "1" )
        kill_wm stumpwm
        ;;
    "2" )
        kill_wm clfswm
        ;;
esac
