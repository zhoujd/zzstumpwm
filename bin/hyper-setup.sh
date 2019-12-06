#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)

BIN_TARGET=/usr/bin
sudo tee $BIN_TARGET/hyper <<EOF
#/bin/bash
$ZZSTUMPWM_ROOT/bin/hyper \$*
EOF

sudo chmod +x $BIN_TARGET/hyper

echo "setup $BIN_TARGET/hyper done"
