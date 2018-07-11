xorg misc
=========

1. Monitor Setting add to ~/.xinitrc

        $ cvt 1680 1050
        $ xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
        $ xrandr --addmode DP-1 "1680x1050_60.00"
        $ xrandr --output DP-1 --same-as DP-2 --mode "1680x1050_60.00"
        
        ## examples
        $ xrandr --output DP-1 --same-as DP-2 --mode --auto
        $ xrandr --output DP-1 --off
        $ xrandr --output DP-1 --auto --output DP-2 --off
        
