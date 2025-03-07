Ubunut 18.04 Server
===================

## Install Ubuntu 18.04 Server

    $ sudo EDITOR=nano visudo
    Defaults env_keep+="http_proxy https_proxy ftp_proxy no_proxy"

    $ sudo vim /etc/locale.gen
      en_US.UTF-8 UTF-8
    $ sudo locale-gen
    $ sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    $ sudo date -s YYYY/MM/DD
    $ sudo date -s hh:mm:ss
    $ sudo hwclock --systohc --utc

## Set Proxy for internet access

    $ export http_proxy=http://proxy-prc.*****.com:911
    $ export https_proxy=$http_proxy
    $ export ftp_proxy=$http_proxy
    $ export no_proxy="localhost,127.0.0.0/8,::1,10.0.0.0/8,192.168.0.0/16"

## Install desktop

    $ sudo apt install xorg xauth
    $ sudo apt install lightdm lightdm-gtk-greeter
    $ sudo apt install xfce4

## Remove MOTD messages

    $ sudo rm /var/lib/ubuntu-release-upgrader/release-upgrade-available

    $ sudo /usr/lib/ubuntu-release-upgrader/release-upgrade-motd
    or
    $ sudo /etc/update-motd.d/91-release-upgrade

    $ sudo chmod -x /usr/lib/ubuntu-release-upgrader/release-upgrade-motd

## Install tools

    $ sudo apt install rxvt-unicode rxvt-unicode-256color
    $ sudo apt install git git-email gitk tmux vim byobu ncurses-term rofi
    $ sudo apt install firefox w3m
    $ sudo apt install sbcl python texinfo meld
    $ sudo apt install gcc g++ make cmake autoconf libtool yasm

## Install sound

    $ sudo apt install alsa-base pulseaudio
    $ sudo alsa force-reload

    $ amixer -D pulse sset Master 5%+
    # amixer -D pulse sset Master 5%-
    $ amixer -D pulse sset Master 50%
    $ amixer -D pulse set Master unmute
    $ amixer -D pulse set Master mute
    $ amixer -D pulse set Master toggle

## Disable apt daily

    $ sudo systemctl stop apt-daily.service
    $ sudo systemctl kill --kill-who=all apt-daily.service

    $ sudo systemctl disable apt-daily.timer
    $ sudo systemctl disable apt-daily.service
    $ sudo systemctl mask apt-daily.service
    $ sudo systemctl mask apt-daily.timer
    $ systemctl list-unit-files apt* --all

## Change from GDM to LightDM

    $ sudo apt-get install lightdm
    $ sudo dpkg-reconfigure lightdm

## Unclutter hides your X mouse cursor when you do not need it

    ##https://wiki.archlinux.org/title/unclutter
    $ sudo apt install unclutter
