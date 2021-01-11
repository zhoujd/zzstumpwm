#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
XPROFILE_BIN=/usr/bin/xprofile
XPROFILE_PATH=$HOME/.xprofile


## sudo apt install dconf-cli

install_xprofile() {
    sudo ln -sfv $ZZSTUMPWM_ROOT/misc/.xprofile $XPROFILE_BIN
    rm -f $XPROFILE_PATH
    tee $XPROFILE_PATH <<EOF
#!/bin/bash
test -x $XPROFILE_BIN && $XPROFILE_BIN
EOF
    chmod +x $XPROFILE_PATH
}

install_xprofile

echo "xprofile_setup done"
