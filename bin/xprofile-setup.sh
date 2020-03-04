#!/bin/bash
#set -x -v

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZZSTUMPWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
ZZXPROFILE_PATH=/usr/bin/zzxprofile

install_zzxprofile() {
    sudo tee $ZZXPROFILE_PATH <<EOF
## zz xprofile
$ZZSTUMPWM_ROOT/misc/.xprofile
EOF
    sudo chmod +x $ZZXPROFILE_PATH
}

install_auto() {
    local xprofile_rc=z02xprofile
    if [ -d /etc/rc.zach.d ]; then
        sudo tee /etc/rc.zach.d/$xprofile_rc <<EOF
#!/bin/bash

do_start() {
    echo "\$0 start"
    test -x $ZZXPROFILE_PATH && $ZZXPROFILE_PATH
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
        sudo chmod +x /etc/rc.zach.d/$xprofile_rc
    else
        echo "Install /etc/rc.zach.d is not exist"
    fi
    
    echo "Install zzxprofile auto done"

}

install_zzxprofile
install_auto

echo "xprofile_setup done"
