#!/bin/bash

target=$1

case $target in
    ubuntu )
        sudo apt install -y rlwrap
        sudo apt install -y sbcl
        sudo apt install -y rofi keynav
        ;;
    arch|majaro )
        sudo pacman -S rlwrap
        sudo pacman -S sbcl
        sudo pacman -S rofi keynav
        ;;
    * )
        echo "Use $0 [ubuntu|arch|manjaro]"
        exit 1;
        ;;
esac
