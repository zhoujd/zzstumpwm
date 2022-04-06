#!/bin/bash

target=$1

case $target in
    ubuntu )
        sudo apt install -y rlwrap wmctrl
        sudo apt install -y sbcl
        sudo apt install -y rofi keynav slop
        ;;
    arch|majaro )
        sudo pacman -S rlwrap wmctrl
        sudo pacman -S sbcl
        sudo pacman -S rofi keynav slop
        ;;
    * )
        echo "Use $0 [ubuntu|arch|manjaro]"
        exit 1;
        ;;
esac
