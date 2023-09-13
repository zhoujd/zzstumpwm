#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZEMACS_ROOT=$HOME/zzemacs
ZWM_ROOT=$HOME/zzstumpwm

setup_common() {
    echo "Setup common ..."
    touch $HOME/.Xauthority
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
    pushd $ZWM_ROOT
    ./install.sh
    sleep 2s
    ./bin/zwm-session
    popd
}

setup_sleep() {
    echo "Setup sleep ..."
    sleep infinity
}

setup_help() {
    echo "Usage: $0 {init|help}"
}


CMD=${1:-""}
case "$CMD" in
    "init" )
        setup_common
        setup_zzemacs
        setup_libvirtd
        setup_dbus
        setup_ssh
        setup_sleep
        ;;
    "zwm" )
        setup_common
        setup_zzemacs
        setup_libvirtd
        setup_dbus
        setup_ssh
        setup_zwm
        ;;
    "help" )
        setup_help
        ;;
    * )
        exec "$@"
        ;;
esac
