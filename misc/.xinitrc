### .xinitrc
## startx ~/.xinitrc <WM>

WM=${1:-dwm}

# WM=stumpwm startx
case $WM in
    stumpwm )
        exec stumpwm-session
        ;;
    clfswm )
        exec clfswm-session
        ;;
    zwm )
        exec zwm-session
        ;;
    dwm )
        exec dwm-session
        ;;
    cwm )
        exec cwm-session
        ;;
    * )
        exec $1
        ;;
esac
