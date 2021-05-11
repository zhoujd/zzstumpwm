#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
BRIGHT_PATH=/usr/bin/brightness-setup.sh

install_brightness() {
    sudo ln -sfv $ZZSTUMPWM_ROOT/libexec/brightness-setup.sh $BRIGHT_PATH
}

install_auto() {
    local backlight_rc=z02backlight
    if [ -d /etc/rc.zach.d ]; then
        sudo tee /etc/rc.zach.d/$backlight_rc <<EOF
#!/bin/bash

do_start() {
    echo "\$0 start"
    test -x $BRIGHT_PATH && $BRIGHT_PATH
}

do_stop() {
    echo "\$0 stop"
}

case "\$1" in
    start)
    	do_start
        ;;
    stop)
        do_stop
        ;;
    *)
        echo "Usage: \$0 {start|stop}" >&2
        exit 3
        ;;
esac
exit 0
EOF
        sudo chmod +x /etc/rc.zach.d/$backlight_rc
    else
        echo "Install /etc/rc.zach.d is not exist"
    fi
    
    echo "Install auto done"

}

install_brightness
install_auto

echo "backlight_setup done"
