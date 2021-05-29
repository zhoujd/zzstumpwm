#!/bin/bash

test -f ~/.Xresources && xrdb -load ~/.Xresources
test -f ~/.Xmodmap && xmodmap ~/.Xmodmap
