#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

### Ubuntu 20.04 Yaru theme, icon and sound
install_dep() {
    echo "Install deps"
    sudo apt install yaru-theme-gtk yaru-theme-icon yaru-theme-sound
}

install_user() {
    echo "Install gtk3 config to user"
    local target=~/.config/gtk-3.0/settings.ini
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.config/gtk-3.0/settings.ini $target
}

install_sys() {
    echo "Install gtk3 config to $target"
    local target=/etc/gtk-3.0/settings.ini
    sudo sed -i 's/gtk-theme-name.*/gtk-theme-name = Yaru/' $target
    sudo sed -i 's/gtk-icon-theme-name.*/gtk-icon-theme-name = Yaru/' $target
}

install_cursor() {
    local target=$HOME/.icons/default
    echo "Install gtk3 cursor config to $target"
    mkdir -p $target
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.icons/default/index.theme $target/index.theme
}

case $1 in
    dep )
        install_dep
        ;;
    user )
        install_user
        ;;
    sys )
        install_sys
        ;;
    cursor )
        install_cursor
        ;;
    * )
        echo "Usage: $0 {dep|user|sys|cursor}"
        ;;
esac
