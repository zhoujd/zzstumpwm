#!/bin/sh

case "$1" in
    "ubuntu" )
        sudo apt-get install -y libevent-dev ncurses-dev
        ;;
    "suse" )
        sudo zypper install -y ncurses-devel
        ;;
    "centos")
        sudo yum install -y ncurses-devel
        ;;
    "fedora")
        sudo dnf install -y ncurses-devel
        ;;
    "arch" )
        ;;
    * )
        echo "Use $0 [ubuntu|suse|centos|fedora]"
        ;;
esac
