#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

install_zwmrc() {
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.zwmrc $HOME/.zwmrc
    ln -sfvT $ZZSTUMPWM_ROOT/misc/.zwmrc.d $HOME/.zwmrc.d
}

install_zwm() {
    local target=/usr/bin/zwm
    sudo tee $target <<EOF
#!/bin/sh

if [ -f ~/.zwmrc ]; then
    . ~/.zwmrc
else
    echo "Cannot find ~/.zwmrc"
fi
EOF
    sudo chmod +x $target
}

install_zwmrc
install_zwm

echo "zwmrc_setup done"
