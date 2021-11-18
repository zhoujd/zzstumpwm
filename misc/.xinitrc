### .xinitrc

## Source zwmrc
if [ -f ~/.zwmrc ]; then
    . ~/.zwmrc 2>&1 > ~/.zwmrc.log
fi

### Switching between desktop environments/window managers
## WM=stumpwm startx
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
