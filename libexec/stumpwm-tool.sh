#!/bin/bash

target=$1

case $target in
    ubuntu )
        sudo apt install -y rofi keynav scrot slop xclip
        sudo apt install -y sbcl
        sudo apt install -y acpi rlwrap wmctrl
        ;;
    arch|majaro )
        sudo pacman -S rofi keynav scrot slop xclip
        sudo pacman -S sbcl
        sudo pacman -S acpi rlwrap wmctrl
        ;;
    * )
        echo "Use $0 [ubuntu|arch|manjaro]"
        exit 1;
        ;;
esac
