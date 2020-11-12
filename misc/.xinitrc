### .xinitrc

# Here stumpwm is kept as default
session=${1:-stumpwm}

# Run ~/zzstumpwm/xprofile-setup.sh
test -x ~/.xprofile && ~/.xprofile

case $session in
    stumpwm )
        exec sbcl --eval '(ql:quickload :stumpwm)' \
                  --eval '(stumpwm:stumpwm)'
        ;;
    clfswm )
        exec sbcl --eval '(ql:quickload :clfswm)' \
                  --eval '(clfswm:main)'
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
