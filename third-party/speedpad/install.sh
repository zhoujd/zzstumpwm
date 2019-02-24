#!/bin/bash

## sudo pacman -S fortune-mod

echo "Install speedpad to /usr"

sudo install bin/speedpad /usr/bin
sudo install man/speedpad.1 /usr/share/man

echo "Install speedpad done"
