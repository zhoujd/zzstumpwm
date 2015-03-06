#!/bin/sh

case "$1" in
    "ubuntu" )
        sudo apt-get install libXinerama-dev libX11-dev
        ;;
    "suse" )
        sudo zypper install libXinerama-devel libX11-devel xorg-x11-server-devel
        ;;
    "centos")
        sudo yum install libXinerama-devel libX11-devel xorg-x11-server-devel
        ;;
    * )
        echo "Use $0 [ubuntu|suse|centos]"
        ;;
esac
