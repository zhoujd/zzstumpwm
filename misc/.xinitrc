### .xinitrc

### Switching between desktop environments/window managers
## $ WM=stumpwm startx
case $WM in
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
        exec zwm
        ;;
esac
