#!/bin/sh

case "$1" in
    "ubuntu" )
        sudo apt-get install -y libxinerama-dev libx11-dev g++ libxft-dev
        ;;
    "suse" )
        sudo zypper install -y libXinerama-devel libX11-devel xorg-x11-server-devel
        ;;
    "centos")
        sudo yum install -y libXinerama-devel libX11-devel xorg-x11-server-devel
        ;;
    "fedora")
        sudo dnf install -y libXinerama-devel libX11-devel xorg-x11-server-devel
        ;;
    "arch")
        ;;
    * )
        echo "Use $0 [ubuntu|suse|centos|fedora|arch]"
        ;;
esac
