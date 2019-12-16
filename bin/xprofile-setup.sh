#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

## setup .xprofile
sudo ln -sfv $ZZSTUMPWM_ROOT/misc/.xprofile /etc/profile.d/zz-xprofile

echo "xprofile_setup done"
