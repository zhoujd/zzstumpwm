#!/bin/bash

DL_ROOT=~/Downloads

install_theme() {
    local TGT=$HOME/.themes
    mkdir -p $DL_ROOT
    mkdir -p $TGT
    pushd $DL_ROOT
    git clone https://github.com/vinceliuice/WhiteSur-gtk-theme
    cd WhiteSur-gtk-theme
    ./install.sh -d $TGT
    popd
}

install_icon() {
    local TGT=$HOME/.icons
    mkdir -p $DL_ROOT
    mkdir -p $TGT
    pushd $DL_ROOT
    git clone https://github.com/vinceliuice/WhiteSur-icon-theme
    cd WhiteSur-icon-theme
    ./install.sh -d $TGT
    popd
}

install_cursor() {
    local TGT=$HOME/.icons
    mkdir -p $DL_ROOT
    mkdir -p $TGT
    pushd $DL_ROOT
    git clone https://github.com/vinceliuice/McMojave-cursors
    cd McMojave-cursors
    rm -rf $TGT/McMojave-cursors
    cp -pr dist $TGT/McMojave-cursors
    popd
}

install_theme
install_icon
install_cursor


echo "Xfce Setup Done"
