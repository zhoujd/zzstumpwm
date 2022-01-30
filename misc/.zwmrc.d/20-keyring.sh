#!/bin/bash

echo "[keyring] gnome-keyring"
gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg
