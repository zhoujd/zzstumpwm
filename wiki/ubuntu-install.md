Ubunut 18.04 Sever Install
==========================

1. Install Ubuntu 18.04 Server

        # EDITOR=nano visudo
        Defaults env_keep+="http_proxy https_proxy ftp_proxy no_proxy"

2. Set Proxy for internet access

        $ export http_proxy=http://proxy-prc.*****.com:911

3. Install desktop

        $ sudo apt install xorg xauth
        $ sudo apt install lightdm lightdm-gtk-greeter
        $ sudo apt install xfce4

