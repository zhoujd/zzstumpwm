#!/bin/bash

echo "[common] load X resource"
[ -f ~/.Xresources ] && xrdb -load ~/.Xresources

echo "[common] load us keyboard"
ibus engine xkb:us::eng

echo "[common] load X modmap"
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
