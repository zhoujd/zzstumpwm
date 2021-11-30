#!/bin/bash

echo "[common] load X resource"
test -f ~/.Xresources && xrdb -load ~/.Xresources

echo "[common] load X modmap"
test -f ~/.Xmodmap && xmodmap ~/.Xmodmap
