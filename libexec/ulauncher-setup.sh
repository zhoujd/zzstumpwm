#!/bin/bash

## https://ulauncher.io/
## Press Alt+Enter to access an alt menu

version=5.15.7
Install_ulauncher() {
    echo "Install ulauncher"
    local tmp=~/.tmp
    echo "Install ulauncher"
    mkdir -p $tmp
    pushd $tmp
    wget https://github.com/Ulauncher/Ulauncher/releases/download/${version}/ulauncher_${version}_all.deb
    sudo apt update
    sudo apt install ./ulauncher_${version}_all.deb
    popd
}

Install_theme() {
    echo "Install theme"
    local theme_target=~/.config/ulauncher/user-themes
    mkdir -p $theme_target
    pushd $theme_target
    git clone https://github.com/yerbestpal/ambiant-mate-ulauncher-theme
    popd
}

Install_ext() {
    cat <<EOF
Open Ulauncher and go in the extensions page
Click on '+ add extension' and paste https://github.com/IkorJefocur/ulauncher-commandrunner
EOF
}

Install_ulauncher
Install_theme
Install_ext

echo "Install ulauncher Done ..."
