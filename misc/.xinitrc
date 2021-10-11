### .xinitrc

## Here stumpwm is kept as default
session=${1:-stumpwm}

case $session in
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
        exec $1
        ;;
esac
