rofi
====

## Install rofi

    ##https://github.com/davatorium/rofi
    ##https://github.com/davatorium/rofi/blob/next/INSTALL.md
    ##https://wiki.archlinux.org/title/Rofi
    $ sudo apt install rofi
    or
    $ sudo yum install rofi

## Themes

    ##https://github.com/lr-tech/rofi-themes-collection
    ##obtain a template configuration file
    $ rofi -dump-config > config.rasi
    ##migrate from the old the new configuration syntax
    $ rofi -upgrade-config
