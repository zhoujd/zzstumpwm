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

## Set Nano configure
rm -f ~/.nanorc
ln -s $CURRENT_DIR/misc/.nanorc ~/.nanorc

## Set tmux configure
rm -f ~/.tmux.conf
ln -s $CURRENT_DIR/misc/.tmux.conf ~/.tmux.conf

## Set byobu configure
rm -f ~/.byobu
ln -s $CURRENT_DIR/misc/.byobu ~/.byobu

## Set csh configure
rm -f ~/.cshrc
ln -s $CURRENT_DIR/misc/.cshrc ~/.cshrc

## Install .Xresources
rm -f ~/.Xresources
ln -s $CURRENT_DIR/misc/.Xresources ~/.Xresources

## Install .Xdefaults
rm -f ~/.Xdefaults
ln -s $CURRENT_DIR/misc/.Xdefaults ~/.Xdefaults

## Install .inputrc
rm -f ~/.inputrc
ln -s $CURRENT_DIR/misc/.inputrc ~/.inputrc

## Install .urxvt
rm -f ~/.urxvt
ln -s $CURRENT_DIR/misc/.urxvt ~/.urxvt

## Install .xrdb
rm -f ~/.xrdb
ln -s $CURRENT_DIR/misc/.xrdb ~/.xrdb

## Install .xinitrc
rm -f ~/.xinitrc
ln -s $CURRENT_DIR/misc/.xinitrc ~/.xinitrc

## Install .keynavrc
rm -f ~/.keynavrc
ln -s $CURRENT_DIR/misc/.keynavrc ~/.keynavrc

## Install rofi
mkdir -p ~/.config
rm -f ~/.config/rofi
ln -s $CURRENT_DIR/misc/.config/rofi ~/.config/rofi

echo "install stumpwm end ..."
