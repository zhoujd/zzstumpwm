### .xinitrc

# source zwmrc
[ -f ~/.zwmrc ] && . ~/.zwmrc 2>&1 > ~/.zwmrc.log

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
