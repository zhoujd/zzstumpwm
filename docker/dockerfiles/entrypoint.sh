#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
DISPLAY=${DISPLAY:-":0.0"}

ZZEMACS_ROOT=$HOME/zzemacs
ZWM_ROOT=$HOME/zzstumpwm
ZWM_DISP=${ZWM_DISP:-":110"}
ZWM_WIDTH=${ZWM_WIDTH:-1280}
ZWM_HEIGHT=${ZWM_WIDTH:-720}

setup_common() {
    echo "Setup common ..."
    touch $HOME/.Xauthority
    $ZWM_ROOT/install.sh
}

setup_zzemacs() {
    local install_cmd=$ZZEMACS_ROOT/docker/script/install.sh
    if [ -x $install_cmd ]; then
        echo "Setup zzemacs ..."
        $install_cmd
    fi
}

setup_libvirtd() {
    local libvirtd_cmd=/usr/sbin/libvirtd
    if [ -x $libvirtd_cmd ]; then
        echo "Setup libvirtd ..."
        sudo $libvirtd_cmd -d
    fi
}

setup_dbus() {
    local dbus_cmd=/etc/init.d/dbus
    if [ -x $dbus_cmd ]; then
        echo "Setup dbus ..."
        sudo $dbus_cmd start
    fi
}

setup_ssh() {
    local ssh_cmd=/etc/init.d/ssh
    if [ -x $ssh_cmd ]; then
        echo "Setup ssh ..."
        sudo $ssh_cmd start
    fi
}

setup_zwm() {
    echo "Setup zwm ..."

    XEPHYR_PARAM=(
        -ac
        -br
        -screen ${ZWM_WIDTH}x${ZWM_HEIGHT}
        -resizeable
        -extension MIT-SHM
        -extension XTEST
        $ZWM_DISP
    )

    Xephyr ${XEPHYR_PARAM[@]} &
    sleep 2s

    DISPLAY=$ZWM_DISP $ZWM_ROOT/bin/zwm-session
}

setup_sleep() {
    echo "Setup sleep ..."
    sleep infinity
}

setup_help() {
    echo "Usage: $0 {zwm|init|help}"
}


CMD=${1:-""}
case "$CMD" in
    "zwm" )
        setup_common
        setup_zzemacs
        setup_libvirtd
        setup_dbus
        setup_ssh
        setup_zwm        
        ;;
    "init" )
        setup_common
        setup_zzemacs
        setup_libvirtd
        setup_dbus
        setup_ssh
        setup_sleep
        ;;
    "help" )
        setup_help
        ;;
    * )
        exec "$@"
        ;;
esac
