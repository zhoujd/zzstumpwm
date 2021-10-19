### .xinitrc

### Switching between desktop environments/window managers
## $ WM=stumpwm startx
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
        echo "Unsupport $WM"
        ;;
esac
