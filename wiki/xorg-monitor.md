xorg monitor
============

1. Monitor Setting add to ~/.xinitrc

        $ cvt 1680 1050
        $ xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
        $ xrandr --addmode DP-1 "1680x1050_60.00"
        $ xrandr --output DP-1 --same-as DP-2 --mode "1680x1050_60.00"
        
        ## examples
        $ xrandr --output DP-1 --same-as DP-2 --mode --auto
        $ xrandr --output DP-1 --off
        $ xrandr --output DP-1 --auto --output DP-2 --off

2. Permanently adding undetected resolutions

/usr/share/X11/xorg.conf.d/10-monitor.conf
/etc/X11/xorg.conf.d/10-monitor.conf
"""
Section "Monitor"
    Identifier "DP-1"
    Modeline "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
    Option "PreferredMode" "1680x1050_60.00"
EndSection

Section "Screen"
    Identifier "Screen0"
    Monitor "DP-1"
    DefaultDepth 24
    SubSection "Display"
        Modes "1680x1050_60.00"
    EndSubSection
EndSection

Section "Device"
    Identifier "Device0"
    Driver "intel"
EndSection
"""

