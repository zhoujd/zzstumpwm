keyboard
========

## Dconf for keyboard active

    ## gnome-settings-daemon that resets layouts when attach a new keyboard
    ## sudo apt install dconf-cli
    $ dconf write /org/gnome/settings-daemon/plugins/keyboard/active false
