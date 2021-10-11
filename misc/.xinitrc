### .xinitrc

## Here stumpwm is kept as default
session=${1:-stumpwm}

case $session in
    stumpwm|clfswm )
        exec $HOME/zzstumpwm/bin/zwm-session $session
        ;;
    sawfish )
        exec sawfish
        ;;
    xfce )
        exec startxfce4
        ;;
    * )
        exec $1
        ;;
esac
