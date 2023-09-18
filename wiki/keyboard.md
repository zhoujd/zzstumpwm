keyboard
========

## Dconf for keyboard active

    ## gnome-settings-daemon that resets layouts when attach a new keyboard
    ## sudo apt install dconf-cli
    $ dconf write /org/gnome/settings-daemon/plugins/keyboard/active false


## Change Caps Lock to Ctrl

    ## https://dev.to/tallesl/change-caps-lock-to-ctrl-3c4
    $ sudo vi /etc/default/keyboard

    ## For swapping the Caps Lock with Ctrl
    XKBOPTIONS="ctrl:swapcaps"

    ## For just changing Caps Lock (and not the Ctrl key)
    XKBOPTIONS="ctrl:nocaps"

    ## To apply the new configuration
    $ sudo dpkg-reconfigure keyboard-configuration
