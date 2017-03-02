#!/bin/bash

echo "Install third-party start ..."

target=$1

## parameter check
case "$target" in
    "ubuntu"|"suse"|"centos"|"fedora" )
        echo "Install on $target"

        for tool in xtrlock tmux dmenu ; do
            echo "Install $tool ..."
            pushd $tool
            ./install.sh $target
            popd
        done
        ;;
    * )
        echo "Use $0 [ubuntu|suse|centos|fedora]"
        exit 1;
        ;;
esac

echo "Install third-party end ..."
