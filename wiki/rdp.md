RDP
===

## xfreerdp

    $ sudo apt install freerdp2-x11 freerdp2-shadow-x11
    $ xfreerdp
    $ cat ~/.jiandon-mobl
    /t:jiandon-mobl
    /smart-sizing
    /w:1920
    /h:1080
    /sound
    /microphone
    /clipboard
    /disp
    $ xfreerdp ~/.jiandon-mobl.rdp -grab-keyboard \
      /u:<domain>\<user> \
      /p:<passwd> \
      /v:<host>

## rdp on Linux

    ## https://linuxize.com/post/how-to-install-xrdp-on-ubuntu-18-04/
    ## Installing Xrdp
    $ sudo apt update
    $ sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
    $ sudo apt install xrdp
    $ sudo systemctl status xrdp
    $ sudo adduser xrdp ssl-cert
    ## Configuring Xrdp in /etc/xrdp {xrdp.ini|startwm.sh}
    ## Configuring Firewall
    $ sudo ufw allow from 192.168.1.0/24 to any port 3389
    $ sudo ufw allow 3389
