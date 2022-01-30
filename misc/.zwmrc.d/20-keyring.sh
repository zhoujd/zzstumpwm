#!/bin/bash

echo "[keyring] gnome-keyring"
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
