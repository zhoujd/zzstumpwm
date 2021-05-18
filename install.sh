#!/bin/sh

CURRENT_DIR=`pwd`

echo "install stumpwm start ..."

## Set asdf load folder
mkdir -p ~/common-lisp

## Set configure file and quicklisp
ln -sfvT $CURRENT_DIR/.stumpwmrc ~/.stumpwmrc
ln -sfvT $CURRENT_DIR/.clfswmrc ~/.clfswmrc
ln -sfvT $CURRENT_DIR/quicklisp ~/quicklisp
ln -sfvT $CURRENT_DIR/lisp ~/lisp

## Set SBCL configre
ln -sfvT $CURRENT_DIR/misc/.sbclrc ~/.sbclrc

## Set ECL configure
ln -sfvT $CURRENT_DIR/misc/.eclrc ~/.eclrc

## Set CLISP configure
ln -sfvT $CURRENT_DIR/misc/.clisprc ~/.clisprc

## Set Vim configure
ln -sfvT $CURRENT_DIR/misc/.vimrc ~/.vimrc

## Set Nano configure
ln -sfvT $CURRENT_DIR/misc/.nanorc ~/.nanorc

## Set tmux configure
ln -sfvT $CURRENT_DIR/misc/.tmux.conf ~/.tmux.conf

## Set byobu configure
ln -sfvT $CURRENT_DIR/misc/.byobu ~/.byobu

## Set csh configure
ln -sfvT $CURRENT_DIR/misc/.cshrc ~/.cshrc

## Install .Xresources
ln -sfvT $CURRENT_DIR/misc/.Xresources ~/.Xresources

## Install .Xdefaults
ln -sfvT $CURRENT_DIR/misc/.Xdefaults ~/.Xdefaults

## Install .inputrc
ln -sfvT $CURRENT_DIR/misc/.inputrc ~/.inputrc

## Install .urxvt
ln -sfvT $CURRENT_DIR/misc/.urxvt ~/.urxvt

## Install .xrdb
ln -sfvT $CURRENT_DIR/misc/.xrdb ~/.xrdb

## Install .xinitrc
ln -sfvT $CURRENT_DIR/misc/.xinitrc ~/.xinitrc

## Install .xsession
ln -sfvT $CURRENT_DIR/misc/.xsession ~/.xsession

## Install .keynavrc
ln -sfvT $CURRENT_DIR/misc/.keynavrc ~/.keynavrc

## Install rofi
mkdir -p ~/.config
ln -sfvT $CURRENT_DIR/misc/.config/rofi ~/.config/rofi

echo "install stumpwm end ..."
