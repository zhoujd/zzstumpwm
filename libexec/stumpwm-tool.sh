#!/bin/bash

target=$1

case $target in
    ubuntu )
        sudo apt install -y rlwrap wmctrl scrot
        sudo apt install -y sbcl
        sudo apt install -y rofi keynav slop
        sudo apt install -y acpi
        ;;
    arch|majaro )
        sudo pacman -S rlwrap wmctrl scrot
        sudo pacman -S sbcl
        sudo pacman -S rofi keynav slop
        sudo pacman -S acpi
        ;;
    * )
        echo "Use $0 [ubuntu|arch|manjaro]"
        exit 1;
        ;;
esac
