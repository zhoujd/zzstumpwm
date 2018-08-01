#!/bin/sh

CURRENT_DIR=`pwd`

echo "uninstall stumpwm start ..."

## Set configure file and quicklisp
rm -f ~/.stumpwmrc
rm -f ~/.clfswmrc
rm -f ~/quicklisp
rm -f ~/lisp

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
## Remove .xinitrc
rm -f ~/.xinitrc
## Remove .tmux.conf
rm -f ~/.tmux.conf
## Remove .Xresource
rm -f ~/.Xresource
## Remove .Xdefaults
rm -f ~/.Xdefaults
## Remove .inputrc
rm -f ~/.inputrc
## Remove .urxvt
rm -f ~/.urxvt
## Remove .xrdb
rm -f ~/.xrdb


echo "uninstall stumpwm end ..."
