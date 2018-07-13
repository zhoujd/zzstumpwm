VBox features
=============

1. On Arch Linux

        ## https://wiki.archlinux.org/index.php/VirtualBox
        ## http://www.cs.columbia.edu/~jae/4118/arch-setup-2018-1.html

        $ sudo systemctl enable vboxservice.service
        $ sudo systemctl start vboxservice.service

        $ sudo pacman -S virtualbox-guest-utils virtualbox-host-dkms
        $ VBoxClient --clipboard --draganddrop --seamless --display --checkhostversion
        $ VBoxClient-all
