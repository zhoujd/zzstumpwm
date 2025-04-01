#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

install() {
    echo "tprofile install"
    ln -sf $ZZSTUMPWM_ROOT/misc/.tprofile ~/.tprofile
    ## setup .profile or .bash_profile
    tee -a ~/.profile <<EOF
# tprofile
if [ -x "\$HOME/.tprofile" ]; then
    \$HOME/.tprofile
fi
EOF
}

install

echo "tprofile setup done"
