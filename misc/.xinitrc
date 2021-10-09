### .xinitrc

# Here stumpwm is kept as default
session=${1:-stumpwm}

## Source zwmrc
test -f ~/.zwmrc && . ~/.zwmrc

case $session in
    stumpwm )
        exec stumpwm
        ;;
    clfswm )
        exec clfswm
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
