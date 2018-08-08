Ubunut 18.04 Server
===================

1. Install Ubuntu 18.04 Server

        $ sudo EDITOR=nano visudo
        Defaults env_keep+="http_proxy https_proxy ftp_proxy no_proxy"

2. Set Proxy for internet access

        $ export http_proxy=http://proxy-prc.*****.com:911
        $ export https_proxy=$http_proxy
        $ export ftp_proxy=$http_proxy
        $ export no_proxy="localhost,127.0.0.0/8,::1,10.0.0.0/8,192.168.0.0/16"

3. Install desktop

        $ sudo apt install xorg xauth
        $ sudo apt install lightdm lightdm-gtk-greeter
        $ sudo apt install xfce4

4. Remove MOTD messages

        $ sudo rm /var/lib/ubuntu-release-upgrader/release-upgrade-available
        $ sudo /usr/lib/ubuntu-release-upgrader/release-upgrade-motd

        or
        $ sudo /etc/update-motd.d/91-release-upgrade
        $ sudo chmod -x /usr/lib/ubuntu-release-upgrader/release-upgrade-motd

5. Install tools

        $ sudo apt install rxvt-unicode rxvt-unicode-256color tmux vim ncurses-term

