#!/bin/bash

echo "Install third-party start ..."

target=$1

## tool list
tool_list=(
    xtrlock
    dmenu
    slock
)

## parameter check
case "$target" in
    "ubuntu"|"suse"|"centos"|"fedora"|"arch" )
        echo "Install on $target"
        for tool in ${tool_list[@]} ; do
            echo "Install $tool ..."
            pushd $tool
            ./install.sh $target
            popd
        done
        ;;
    * )
        echo "Use $0 [ubuntu|suse|centos|fedora|arch]"
        exit 1;
        ;;
esac

echo "Install third-party end ..."
