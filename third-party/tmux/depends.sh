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
    * )
        echo "Use $0 [ubuntu|suse|centos]"
        ;;
esac
