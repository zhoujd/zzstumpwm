#!/bin/sh

CURRENT_DIR=`pwd`

echo "install stumpwm start ..."

## Set configure file and qucklisp
rm -f ~/.stumpwmrc
ln -s $CURRENT_DIR/.stumpwmrc ~/.stumpwmrc

rm -f ~/quicklisp
ln -s $CURRENT_DIR/quicklisp ~/quicklisp

## Set SBCL configre
rm -f ~/.sbclrc
ln -s $CURRENT_DIR/misc/.sbclrc ~/.sbclrc

## Set ECL configure
rm -f ~/.eclrc
ln -s $CURRENT_DIR/misc/.eclrc ~/.eclrc

## Install .xinitrc
rm -f ~/.xinitrc
ln -s $CURRENT_DIR/misc/.xinitrc ~/.xinitrc

## Set Vim configure
rm -f ~/.vimrc
ln -s $CURRENT_DIR/misc/.vimrc ~/.vimrc


echo "install stumpwm end ..."
