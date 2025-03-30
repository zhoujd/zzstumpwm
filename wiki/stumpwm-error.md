Stumpwm Error
=============

## Component 'stumpwm' not found

    ## https://github-wiki-see.page/m/stumpwm/stumpwm/wiki/FAQ
    Create source repository config for ASDF,
    e.g: ~/.config/common-lisp/source-registry.conf.d/my-asdf.conf
    with path to stumpwm directory like: (:tree "~/build/stumpwm/")

## My mouse wheel doesn't work with gtk3 applications

    ## https://github-wiki-see.page/m/stumpwm/stumpwm/wiki/FAQ
    Add the following to your .xinitrc: sh export GDK_CORE_DEVICE_EVENTS=1
    If you don't use a .xsession or a .xinitrc, then you must set this somewhere upstream of stumpwm.
    Alternatively, so long as you don't want to bind any stumpwm commands to the mouse wheel,
    add a when (/= i 4 5) to xwin-grab-buttons.
    This is particularly useful for laptops so that you still get full smooth scrolling on a touchpad.

## Broken: junk in string ""

    debugger invoked on a SB-INT:SIMPLE-PARSE-ERROR in thread
    #<THREAD "main thread" RUNNING {1000510083}>:
    junk in string ""

    $ rm ~/.Xauthority
