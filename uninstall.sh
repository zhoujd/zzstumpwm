#!/bin/sh

CURRENT_DIR=`pwd`

echo "uninstall stumpwm start ..."

## Remove configure file and quicklisp
rm -f ~/.stumpwmrc
rm -f ~/.clfswmrc
rm -f ~/quicklisp
rm -f ~/lisp

## Remove SBCL configre
rm -f ~/.sbclrc
## Remove ECL configure
rm -f ~/.eclrc
## Remove CLISP configure
rm -f ~/.clisprc
## Remove Vim configure
rm -f ~/.vimrc
## Remove Nano configure
rm -f ~/.nanorc
## Remove csh configure
rm -f ~/.cshrc
## Remove .xinitrc
rm -f ~/.xinitrc
## Remove .tmux.conf
rm -f ~/.tmux.conf
## Remove .byobu
rm -f ~/.byobu
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
