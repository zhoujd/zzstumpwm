#!/bin/bash

### Setting example for numix or Tango
## ln -sf `pwd`/.gtkrc-2.0 ~
## apt search icon-theme
## sudo pacman -Ss icon-theme
## sudo apt install tango-icon-theme numix-icon-theme

rm -fv ~/.gtkrc-2.0
tee ~/.gtkrc-2.0 <<EOF
gtk-theme-name = "zach-theme"
gtk-icon-theme-name = "MacBuntu-OS"
EOF
