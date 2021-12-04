### .xinitrc

# source zwmrc
[ -f ~/.zwmrc ] && . ~/.zwmrc

# WM=stumpwm startx
case $WM in
    stumpwm )
        exec stumpwm
        ;;
    zwm )
        exec zwm
        ;;
    sawfish )
        exec sawfish
        ;;
    xfce )
        exec startxfce4
        ;;
    * )
        exec zwm
        ;;
esac
