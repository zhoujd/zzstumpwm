#!/bin/bash

eval `gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh`
export GNOME_KEYRING_CONTROL
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_PID

exec xmodmap ~/.xmodmap
exec xsetroot -cursor_name left_ptr
exec xset s off
exec xset b off
exec ssh-agent /usr/local/bin/stumpwm
