### .xinitrc

XDG_SESSION_TYPE=x11

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
    * )
        exec zwm-session
        ;;
esac
