#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT && pwd)
ZWM_TOP=$(cd $ZWM_ROOT/.. && pwd)

echo "Install stumpwm start ..."

## Set asdf load folder
mkdir -p ~/common-lisp

## Set configure file and quicklisp
ln -sfvT $ZWM_ROOT/.stumpwmrc ~/.stumpwmrc
ln -sfvT $ZWM_ROOT/.clfswmrc ~/.clfswmrc
ln -sfvT $ZWM_ROOT/quicklisp ~/quicklisp
ln -sfvT $ZWM_ROOT/lisp ~/lisp

## Set SBCL configre
ln -sfvT $ZWM_ROOT/misc/.sbclrc ~/.sbclrc

## Set ECL configure
ln -sfvT $ZWM_ROOT/misc/.eclrc ~/.eclrc

## Set CLISP configure
ln -sfvT $ZWM_ROOT/misc/.clisprc ~/.clisprc

## Set Vim configure
ln -sfvT $ZWM_ROOT/misc/.vimrc ~/.vimrc

## Set Nano configure
ln -sfvT $ZWM_ROOT/misc/.nanorc ~/.nanorc

## Set tmux configure
ln -sfvT $ZWM_ROOT/misc/.tmux.conf ~/.tmux.conf

## Set screen configure
ln -sfvT $ZWM_ROOT/misc/.screenrc ~/.screenrc

## Set csh configure
ln -sfvT $ZWM_ROOT/misc/.cshrc ~/.cshrc

## Install .Xresources
ln -sfvT $ZWM_ROOT/misc/.Xresources ~/.Xresources

## Install .Xdefaults
ln -sfvT $ZWM_ROOT/misc/.Xdefaults ~/.Xdefaults

## Install .urxvt
ln -sfvT $ZWM_ROOT/misc/.urxvt ~/.urxvt

## Install .xrdb
ln -sfvT $ZWM_ROOT/misc/.xrdb ~/.xrdb

## Install .xinitrc
ln -sfvT $ZWM_ROOT/misc/.xinitrc ~/.xinitrc

## Install .xsession
ln -sfvT $ZWM_ROOT/misc/.xsession ~/.xsession

## Install .keynavrc
ln -sfvT $ZWM_ROOT/misc/.keynavrc ~/.keynavrc

## Install .Xmodmap.d
ln -sfvT $ZWM_ROOT/misc/.Xmodmap.d ~/.Xmodmap.d

## Make sure the folder ~/.config exist
mkdir -p ~/.config

## Install rofi
ln -sfvT $ZWM_ROOT/misc/.config/rofi ~/.config/rofi
## Install skippy-xd
ln -sfvT $ZWM_ROOT/misc/.config/skippy-xd ~/.config/skippy-xd
## Install xsettingsd
ln -sfvT $ZWM_ROOT/misc/.config/xsettingsd ~/.config/xsettingsd

## Install ibus-rime
$ZWM_ROOT/bin/rime-setup.sh
## Init ZWM
$ZWM_ROOT/bin/zwminit-setup.sh


echo "Install stumpwm end ..."
