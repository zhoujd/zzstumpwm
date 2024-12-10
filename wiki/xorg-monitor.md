xorg monitor
============

## Monitor Setting add to ~/.xinitrc

```
$ cvt 1680 1050
$ xrandr --newmode "1680x1050_60.00"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
$ xrandr --addmode DP-1 "1680x1050_60.00"
$ xrandr --output DP-1 --same-as DP-2 --mode "1680x1050_60.00"

$ xrandr --output DP-1 --same-as DP-2 --mode --auto
$ xrandr --output DP-1 --off
$ xrandr --output DP-1 --auto --output DP-2 --off
```

## Permanently adding undetected resolutions

Ubuntu: /usr/share/X11/xorg.conf.d/10-monitor.conf
Arch: /etc/X11/xorg.conf.d/10-monitor.conf
```
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
```

## Dual Monitors
http://lxlinux.com/index.html
http://lxlinux.com/uxlta.html

```
## Arandr can set-up placement, orientation and resolution for each monitor
$ sudo apt install arandr
```

## Tiling Windows
http://lxlinux.com/tile.html

```
$ wget http://lxlinux.com/winfuncs
$ sudo chmod 755 /usr/local/bin/winfuncs
$ sudo apt-get install wmctrl xdotool x11-utils
$ winfuncs 'tile'
$ winfuncs 'cascade'
$ winfuncs 'tiletwo'
$ winfuncs 'showdesktop'

```

## Number of connection monitors

```
## >2 for having external connected
xrandr --listactivemonitors | awk '/Monitors:/ {print $2}'
```
