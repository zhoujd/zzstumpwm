#!/bin/bash

target=$1

case $target in
    ubuntu )
        sudo apt install rlwrap rofi
        sudo apt install sbcl
        ;;
    arch|majaro )
        sudo pacman -S rlwrap rofi
        sudo pacman -S sbcl
        ;;
    * )
        echo "Use $0 [ubuntu|arch|manjaro]"
        exit 1;
        ;;
esac
