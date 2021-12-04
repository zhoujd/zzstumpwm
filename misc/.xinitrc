### .xinitrc

# source zwmrc
[ -f ~/.zwmrc ] && . ~/.zwmrc

# WM=stumpwm startx
case $WM in
    stumpwm )
        exec stumpwm-session
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
