lightdm
=======

## lightdm install

    $ sudo pacman -S lightdm lightdm-gtk-greeter
    $ sudo systemctl enable lightdm

## login failed

    $ sudo chown $USER:$USER .Xauthority
    $ mv .Xauthority .Xauthority.bak

## ligthdm configure

    $ sudo vim /etc/lightdm/lightdm-gtk-greeter.conf

## cursor theme

    $ cat /usr/share/icons/default/index.theme
    [Icon Theme]
    Inherits=macOSBigSur
