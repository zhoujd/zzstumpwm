clfswm
=======

## Linux - startx cannot open /dev/fb0: Permission denied

    ## https://itectec.com/unixlinux/linux-startx-cannot-open-dev-fb0-permission-denied/
    $ cat ~/.local/share/xorg/Xorg.1.log
    (EE) open /dev/fb0: Permission denied
    $ cat /etc/X11/Xorg.wrap
    needs_root_rights = yes
