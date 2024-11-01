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
    sawfish )
        exec sawfish
        ;;
    xfce )
        exec startxfce4
        ;;
    dwm )
        exec dwm
        ;;
    * )
        exec zwm-session
        ;;
esac
