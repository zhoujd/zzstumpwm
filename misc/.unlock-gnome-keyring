echo 'NOTE: This script will only work if launched via source or .' >&2
echo -n 'Login password: ' >&2
read -s _UNLOCK_PASSWORD || return
killall -q -u "$(whoami)" gnome-keyring-daemon
eval $(echo -n "${_UNLOCK_PASSWORD}" \
           | gnome-keyring-daemon --daemonize --login \
           | sed -e 's/^/export /')
unset _UNLOCK_PASSWORD
echo '' >&2
