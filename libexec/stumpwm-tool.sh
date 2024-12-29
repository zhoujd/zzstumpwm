#!/bin/bash

target=$1

case $target in
    ubuntu )
        sudo apt install -y rofi keynav maim slop xclip xdotool
        sudo apt install -y sbcl
        sudo apt install -y acpi rlwrap wmctrl
        sudo apt install -y lxappearance
        ;;
    arch|majaro )
        sudo pacman -S rofi keynav maim slop xclip xdotool
        sudo pacman -S sbcl
        sudo pacman -S acpi rlwrap wmctrl
        sudo pacman -S lxappearance
        ;;
    * )
        echo "Use $0 [ubuntu|arch|manjaro]"
        exit 1;
        ;;
esac
