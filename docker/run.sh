#!/bin/bash
#set -x

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
ZWM_TOP=$(cd $ZWM_ROOT/.. && pwd)

IMG=${IMG:-zz/ubuntu-20.04-zwm}
TAG=${TAG:-base}
CTN_PREFIX=${CTN_PREFIX:-zwm}
CTN_NAME=${CTN_NAME:-$CTN_PREFIX-$TAG}
CTN_HOST=${CTN_HOST:-ubuntu-2004-zwm}
CTN_USER=${CTN_USER:-$USER}
CTN_HOME=${CTN_HOME:-/home/$CTN_USER}
SSH_HOST=${SSH_HOST:-localhost}
SSH_PORT=${SSH_PORT:-9022}
SSH_USER=${CTN_USER}
HOST_NAME=${HOST_NAME:-dockerhost}
HOST_IP=${HOST_IP:-host-gateway}
PROMPT=${PROMPT:-$(basename $0)}
VIRT_DISPLAY=:100

RUN_PARAM=(
    -d
    -e DISPLAY=:100
    --privileged=true
    --cap-add=ALL
    --add-host=$HOST_NAME:$HOST_IP
    -h $CTN_HOST
    -u $CTN_USER
    -p $SSH_PORT:22
    -v /dev:/dev
    -v /tmp/.X11-unix:/tmp/.X11-unix
    -v /var/run/docker.sock:/var/run/docker.sock
    -v /etc/security/limits.conf:/etc/security/limits.conf
    -v /etc/sysctl.conf:/etc/sysctl.conf
    -v $ZWM_ROOT:$CTN_HOME/zzstumpwm
    -v $ZWM_TOP/zzemacs:$CTN_HOME/zzemacs
    -v $ZWM_TOP/lab:$CTN_HOME/lab
)

EXEC_PARAM=(
    -e DISPLAY=$DISPLAY
    -e SHELL=/bin/bash
    -u $CTN_USER
)

EMACS_PARAM=(
    emacs
    -nw
)

SHELL_PARAM=(
    bash
    -l
)

XEPHYR_PARAM=(
    $VIRT_DISPLAY
    -ac
    -br
    -screen 1920x1080
    -resizeable
)

case $1 in
    dep )
        sudo apt install xserver-xephyr
        ;;
    prepare )
        Xephyr ${XEPHYR_PARAM[@]} &
        ;;
    start )
        docker run --name=${CTN_NAME} ${RUN_PARAM[@]} ${IMG}:${TAG}
        ;;
    stop )
        docker stop ${CTN_NAME} && docker rm ${CTN_NAME}
        ;;
    status )
        docker ps | grep ${CTN_NAME}
        ;;
    emacs )
        docker exec -it ${EXEC_PARAM[@]} ${CTN_NAME} ${EMACS_PARAM[@]}
        ;;
    shell )
        docker exec -it ${EXEC_PARAM[@]} ${CTN_NAME} ${SHELL_PARAM[@]}
        ;;
    ssh )
        TERM=xterm ssh -X -l ${SSH_USER} ${SSH_HOST} -p ${SSH_PORT}
        ;;
    build )
        shift
        make -C dockerfiles $@
        ;;
    clean )
        killall Xephyr
        ;;
    * )
        echo "Usage: ${PROMPT} {dep|prepare|start|stop|status|emacs|shell|ssh|build|clean}"
        ;;
esac
