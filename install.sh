#!/bin/sh

CURRENT_DIR=`pwd`

echo "install stumpwm start ..."

## Set asdf load folder
mkdir -p ~/common-lisp

## Set configure file and quicklisp
rm -f ~/.stumpwmrc
ln -s $CURRENT_DIR/.stumpwmrc ~/.stumpwmrc

rm -f ~/.clfswmrc
ln -s $CURRENT_DIR/.clfswmrc ~/.clfswmrc

rm -f ~/quicklisp
ln -s $CURRENT_DIR/quicklisp ~/quicklisp

rm -f ~/lisp
ln -s $CURRENT_DIR/lisp ~/lisp

## Set SBCL configre
rm -f ~/.sbclrc
ln -s $CURRENT_DIR/misc/.sbclrc ~/.sbclrc

## Set ECL configure
rm -f ~/.eclrc
ln -s $CURRENT_DIR/misc/.eclrc ~/.eclrc

## Set CLISP configure
rm -f ~/.clisprc
ln -s $CURRENT_DIR/misc/.clisprc ~/.clisprc

## Set Vim configure
rm -f ~/.vimrc
ln -s $CURRENT_DIR/misc/.vimrc ~/.vimrc

## Set tmux configure
rm -f ~/.tmux.conf
ln -s $CURRENT_DIR/misc/.tmux.conf ~/.tmux.conf

## Set csh configure
rm -f ~/.cshrc
ln -s $CURRENT_DIR/misc/.cshrc ~/.cshrc

## Install .Xresources
rm -f ~/.Xresources
ln -s $CURRENT_DIR/misc/.Xresources ~/.Xresources

## Install .Xdefaults
rm -f ~/.Xdefaults
ln -s $CURRENT_DIR/misc/.Xdefaults ~/.Xdefaults

echo "install stumpwm end ..."
