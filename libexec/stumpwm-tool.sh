#!/bin/bash

target=$1

case $target in
    ubuntu|debian )
        sudo apt install -y rofi keynav maim slop xclip xdotool
        sudo apt install -y acpi rlwrap wmctrl
        sudo apt install -y lxappearance
        ;;
    arch|majaro )
        sudo pacman -S rofi keynav maim slop xclip xdotool
        sudo pacman -S acpi rlwrap wmctrl
        sudo pacman -S lxappearance
        ;;
    * )
        echo "Use $0 [ubuntu|debian|arch|manjaro]"
        exit 1;
        ;;
esac
