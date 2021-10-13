### .xinitrc

## Here zwm is kept as default
session=${1:-zwm}

case $session in
    zwm )
        exec zwm
        ;;
    stumpwm )
        exec stumpwm
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
