### .xinitrc

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
        exec dwm-session
        ;;
esac
