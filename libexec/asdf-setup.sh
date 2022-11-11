#!/bin/bash

cfg_setup() {
    echo "asdf config setup"
    local tgt=$HOME/.config/common-lisp/source-registry.conf.d
    mkdir -p $tgt
    tee $tgt/50-${USER}-lisp.conf <<EOF
(:tree "$HOME/common-lisp")
(:tree "$HOME/lisp")
EOF
}

cfg_setup

echo "asdf setup done"
