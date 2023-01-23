#!/bin/bash

echo "[keyring] gnome-keyring"
eval $(gnome-keyring-daemon --daemonize --login --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
