#!/bin/sh

INSTALL_ROOT=`pwd`
INSTALL_OS="unknown"

case "$1" in
    "ubuntu" )
        INSTALL_OS=$1
        echo "Install on $INSTALL_OS"
        ;;
    "suse" )
        INSTALL_OS=$1
        echo "Install on $INSTALL_OS"
        ;;
    "centos" )
        INSTALL_OS=$1
        echo "Install on $INSTALL_OS"
        ;;
    * )
        echo "Use $0 [ubuntu|suse|centos]"
        exit 1;
        ;;
esac

echo -n "Do you want to install dependence ? [yN]"
read answer
case "$answer" in
    "Y" | "y" )
        ./depends.sh
        ;;
esac


echo "Install xtrock ..."
cd $INSTALL_ROOT/xtrlock
./build.sh $INSTALL_OS
cd $INSTALL_ROOT

echo "Install tmux ..."
cd $INSTALL_ROOT/tmux
./build.sh $INSTALL_OS
cd $INSTALL_ROOT

echo "Install dmemu ..."
cd $INSTALL_ROOT/dmenu
./build.sh $INSTALL_OS
cd $INSTALL_ROOT
