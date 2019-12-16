#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

## setup .profile or .bash_profile
cat <<EOF >> ~/.bash_profile
[[ -f ~/.tprofile ]] &&  ~/.tprofile
EOF

echo "tprofile_setup done"
