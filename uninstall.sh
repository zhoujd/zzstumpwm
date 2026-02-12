#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT && pwd)
ZWM_TOP=$(cd $ZWM_ROOT/.. && pwd)

echo "Uninstall zwm start ..."

## Remove lisp files
rm -rf ~/common-lisp
rm -f ~/.stumpwmrc
rm -f ~/.clfswmrc
rm -f ~/quicklisp
rm -f ~/lisp
rm -f ~/.sbclrc
rm -f ~/.eclrc
rm -f ~/.clisprc

## Remove configure files
rm -f ~/.vimrc
rm -f ~/.nanorc
rm -f ~/.cshrc
rm -f ~/.xinitrc
rm -f ~/.xsession
rm -f ~/.xprofile
rm -f ~/.tmux.conf
rm -f ~/.screenrc
rm -f ~/.Xresources
rm -f ~/.Xdefaults
rm -f ~/.inputrc
rm -f ~/.urxvt
rm -f ~/.xrdb
rm -f ~/.keynavrc
rm -f ~/.tigrc
rm -f ~/.tigrc.d

rm -f ~/.gtkrc-2.0
rm -f ~/.tprofile
rm -f ~/.vim
rm -f ~/.Xmodmap.d
rm -f ~/.zwmrc
rm -f ~/.zwmrc.d


echo "Uninstall zwm end ..."
