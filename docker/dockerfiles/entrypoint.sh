#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZEMACS_ROOT=$HOME/zzemacs
ZWM_ROOT=$HOME/zzstumpwm

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
    local zwm_cmd=$ZWM_ROOT/bin/zwm-session
    if [ -x $zwm_cmd ]; then
        echo "Setup zwm ..."
        $zwm_cmd
    fi
}

setup_xephyr() {
    local xephyr_cmd=$ZWM_ROOT/bin/zwm-on-xephyr.sh
    if [ -x $xephyr_cmd ]; then
        echo "Setup zwm on xephyr ..."
        $xephyr_cmd
    fi
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
    "xephyr" )
        setup_common
        setup_zzemacs
        setup_libvirtd
        setup_dbus
        setup_ssh
        setup_xephyr
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
