#!/bin/bash

echo "[keyring] gnome-keyring"
eval $(gnome-keyring-daemon --daemonize --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID
