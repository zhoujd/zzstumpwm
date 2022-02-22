#!/bin/bash

echo "[common] load X resource"
[ -f ~/.Xresources ] && xrdb -load ~/.Xresources

echo "[common] load X modmap"
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
