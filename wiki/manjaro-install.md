Manjaro install
================

1. Proxy setting

        $ cat >> ~/.bashrc <<EOF
          export http_proxy=http://proxy-prc.*****.com:911/
          export https_proxy=$http_proxy
          export ftp_proxy=$http_proxy
          export no_proxy="localhost,127.0.0.0/8,::1,10.0.0.0/8,192.168.0.0/16"
          EOF

        # EDITOR=nano visudo
          Defaults env_keep+="http_proxy https_proxy ftp_proxy no_proxy"

2. Repo setting

        $ sudo pacman-mirrors -gb testing -c China
        or
        $ sudo pacman-mirrors -i -c China -m rank
        
        $ sudo vim /etc/pacman.conf
          [archlinuxcn]
          SigLevel = Optional TrustedOnly
          Server = http://repo.archlinuxcn.org/$arch
        
        $ sudo pacman-mirrors -g
        $ sudo pacman -Syyu
