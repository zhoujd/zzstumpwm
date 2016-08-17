#!/bin/bash

target="unknow"

echo "Install third-party start ..."

## parameter check
case "$1" in
    "ubuntu"|"suse"|"centos" )
        target=$1
        echo "Install on $os"
        ;;
    * )
        echo "Use $0 [ubuntu|suse|centos]"
        exit 1;
        ;;
esac

## install dependence
echo -n "Do you want to install dependence ? [yN]"
read answer
case "$answer" in
    "Y" | "y" )
        ./depends.sh $target;
        ;;
esac

## install tool
for tool in xtrlock tmux dmenu ; do
    echo "Install $tool ..."
    pushd $tool
    ./install.sh $target
    popd
done

echo "Install third-party end ..."
