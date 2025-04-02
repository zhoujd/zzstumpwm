#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT && pwd)
ZWM_TOP=$(cd $ZWM_ROOT/.. && pwd)

echo "Uninstall zwm start ..."

## Remove configure file and quicklisp
rm -f ~/.stumpwmrc
rm -f ~/.clfswmrc
rm -f ~/quicklisp
rm -f ~/lisp

## Remove common-lisp
rm -rf ~/common-lisp

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
## Remove .xsession
rm -f ~/.xsession
## Remove .xprofile
rm -f ~/.xprofile
## Remove .tmux.conf
rm -f ~/.tmux.conf
## Remove .screenrc
rm -f ~/.screenrc
## Remove .Xresources
rm -f ~/.Xresources
## Remove .Xdefaults
rm -f ~/.Xdefaults
## Remove .inputrc
rm -f ~/.inputrc
## Remove .urxvt
rm -f ~/.urxvt
## Remove .xrdb
rm -f ~/.xrdb
## Remove .keynavrc
rm -f ~/.keynavrc
## Remove .tigrc
rm -f ~/.tigrc
## Remove .tigrc.d
rm -rf ~/.tigrc.d

echo "Uninstall zwm end ..."
