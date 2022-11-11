#!/bin/bash

DL_DIR=~/Downloads

Install_Deps() {
    echo "Install deps"
    sudo apt install -y sddm
    sudo apt install -y qml-module-qtquick-controls \
        qml-module-qtquick-extras qml-module-qtquick-layouts \
        qml-module-qtgraphicaleffects
}

Install_Chili() {
    echo "Install Chili"
    mkdir -p $DL_DIR
    pushd $DL_DIR
    curl -JL https://github.com/MarianArlt/sddm-chili/archive/0.1.5.tar.gz -o sddm-chili-0.1.5.tar.gz
    sudo tar -xzvf ~/Downloads/sddm-chili-0.1.5.tar.gz -C /usr/share/sddm/themes
    sudo mv /usr/share/sddm/themes/sddm-chili-0.1.5 /usr/share/sddm/themes/chili
    popd
}

Install_test() {
    echo "Test chili"
    sddm-greeter --test-mode --theme /usr/share/sddm/themes/chili
}

Install_Cfg() {
    echo "Install Cfg"
    sudo tee /etc/sddm.conf <<EOF
[Users]
HideUsers=sys_cert
[Theme]
Current=chili
EOF
}

case $1 in
    deps )
        Install_Deps
        ;;
    chili )
        Install_Chili
        ;;
    cfg )
        Install_Cfg
        ;;
    test )
        Install_test
        ;;
    * )
        echo "$(basename $0) {deps|chili|test|cfg}"
        ;;
esac
