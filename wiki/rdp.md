RDP
===

## xfreerdp

    $ sudo apt install freerdp2-x11 freerdp2-shadow-x11
    $ xfreerdp
    $ cat ~/.jiandon-nuc.rdp
    /t:jiandon-nuc
    /smart-sizing
    /w:1920
    /h:1080
    /sound
    /microphone
    /clipboard
    /disp
    $ xfreerdp ~/.jiandon-nuc.rdp -grab-keyboard \
      /u:<domain>\<user> \
      /p:<passwd> \
      /v:<host>

## xrdp on Linux

    ## https://linuxize.com/post/how-to-install-xrdp-on-ubuntu-18-04/
    ## Installing Xrdp
    $ sudo apt update
    $ sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
    $ sudo apt install xrdp
    $ sudo systemctl status xrdp
    $ sudo adduser xrdp ssl-cert

    ## Configuring Xrdp in /etc/xrdp/{xrdp.ini|startwm.sh}
    ## Configuring Firewall
    $ sudo ufw allow from 192.168.1.0/24 to any port 3389
    $ sudo ufw allow 3389

    ## Remove thinclient_drives
    $ sudo umount thinclient_drives
    $ sudo rm -rf thinclient_drives
    $ sudo vim /etc/xrdp/sesman.ini
    FuseMountName=/run/user/%u/thinclient_drives
