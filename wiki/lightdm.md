lightdm
=======

# lightdm install

    # sudo pacman -S lightdm lightdm-gtk-greeter
    # sudo systemctl enable lightdm
    
# login failed

    # chown $USER:$USER .Xauthority
    # mv .Xauthority .Xauthority.bak
