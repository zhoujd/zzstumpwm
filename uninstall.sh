#!/bin/sh

CURRENT_DIR=`pwd`

echo "uninstall stumpwm start ..."

## Set configure file and quicklisp
rm -f ~/.stumpwmrc
rm -f ~/.clfswmrc
rm -f ~/quicklisp

## Set SBCL configre
rm -f ~/.sbclrc
## Set ECL configure
rm -f ~/.eclrc
## Set CLISP configure
rm -f ~/.clisprc
## Set Vim configure
rm -f ~/.vimrc
## Set csh configure
rm -f ~/.cshrc
## Install .xinitrc
rm -f ~/.xinitrc

echo "uninstall stumpwm end ..."
