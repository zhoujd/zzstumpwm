#!/bin/sh

# Identifying our monitors use xrandr tool and view output
LVDS=eDP-1
HDMI=HDMI-1
EXTRA="--right-of $LVDS"
REZ=1920x1080

# Check both LVDS and HDMI state from the string "$display connected "
xrandr | grep -q "$LVDS connected " && LVDS_IS_CON=1 || LVDS_IS_CON=0
xrandr | grep -q "$HDMI connected " && HDMI_IS_CON=1 || HDMI_IS_CON=0
xrandr --listmonitors | grep -q "$LVDS" && LVDS_IS_ON=1 || LVDS_IS_ON=0
xrandr --listmonitors | grep -q "$HDMI" && HDMI_IS_ON=1 || HDMI_IS_ON=0

# Output switch cycle
if [ $HDMI_IS_ON -eq 1 ]; then
    echo "HDMI is ON, turn LVDS on"
    xrandr --output $LVDS --auto
    xrandr --output $HDMI --off
elif [ $LVDS_IS_ON -eq 1 ] && [ $HDMI_IS_CON ]; then
    echo "LVDS is ON, turn HDMI on"
    xrandr --output $LVDS --off
    xrandr --output $HDMI --mode $REZ
    xrandr --output $HDMI --auto
else
    # This should never be reached but just in case..
    xrandr --output $LVDS --auto
fi
