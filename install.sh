#!/bin/sh

CURRENT_DIR=`pwd`


echo "install stumpwm start ..."

rm -f ~/.stumpwmrc
ln -s $CURRENT_DIR/.stumpwmrc ~/.stumpwmrc

echo "install stumpwm end ..."
