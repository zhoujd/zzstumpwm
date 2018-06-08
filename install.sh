#!/bin/sh

CURRENT_DIR=`pwd`

echo "install stumpwm start ..."

## Set asdf load directory
mkdir -p ~/common-lisp/

## Set configure file and quicklisp
rm -f ~/.stumpwmrc
ln -s $CURRENT_DIR/.stumpwmrc ~/.stumpwmrc

rm -f ~/.clfswmrc
ln -s $CURRENT_DIR/.clfswmrc ~/.clfswmrc

rm -f ~/quicklisp
ln -s $CURRENT_DIR/quicklisp ~/quicklisp

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

## Set csh configure
rm -f ~/.cshrc
ln -s $CURRENT_DIR/misc/.cshrc ~/.cshrc

## Install .xinitrc
rm -f ~/.xinitrc
ln -s $CURRENT_DIR/misc/.xinitrc ~/.xinitrc

echo "install stumpwm end ..."
