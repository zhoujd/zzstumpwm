#!/bin/bash

### Setting example for Numix or Tango
## ln -sf `pwd`/.gtkrc-2.0 ~
## apt search icon-theme
## sudo pacman -Ss icon-theme
## sudo apt install tango-icon-theme numix-icon-theme

rm -fv ~/.gtkrc-2.0
tee ~/.gtkrc-2.0 <<EOF
gtk-theme-name = "Yaru-Blue-dark"
gtk-icon-theme-name = "Os-Catalina-Night"
EOF
