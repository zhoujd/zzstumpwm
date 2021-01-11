#!/bin/bash

### Ubuntu 20.04 Yaru theme, icon and sound
install_dep() {
    sudo apt install yaru-theme-gtk yaru-theme-icon yaru-theme-sound
}

install_user() {
    echo "Install gtk3 config to user"

    local target=~/.config/gtk-3.0/settings.ini
    tee $target <<EOF
[Settings]
gtk-theme-name = zach-theme-night
gtk-icon-theme-name = Os-Catalina
EOF
}

install_sys() {
    echo "Install gtk3 config to $target"

    local target=/etc/gtk-3.0/settings.ini
    sudo sed -i 's/gtk-theme-name.*/gtk-theme-name = Yaru/' $target
    sudo sed -i 's/gtk-icon-theme-name.*/gtk-icon-theme-name = Yaru/' $target
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
    * )
        echo "Usage: $0 {dep|user|sys}"
        ;;
esac
