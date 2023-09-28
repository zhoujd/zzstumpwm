#!/bin/bash
#set -x

SCRIPT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ZWM_ROOT=$(cd $SCRIPT_ROOT/.. && pwd)
ZWM_TOP=$(cd $ZWM_ROOT/.. && pwd)
ZWM_DSP_NUM=100
ZWM_DSP=:$ZWM_DSP_NUM

IMG=${IMG:-zz/ubuntu-20.04-zwm}
TAG=${TAG:-dev}
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

EXEC_PARAM=(
    -e SHELL=/bin/bash
    -u $CTN_USER
)

dep() {
    sudo apt install xserver-xephyr
}

prepare() {
    XEPHYR_PARAM=(
        $ZWM_DSP
        -ac
        -br
        -screen 1920x1080
        -resizeable
        -extension MIT-SHM
        -extension XTEST
    )

    Xephyr ${XEPHYR_PARAM[@]} &
}

init() {

    docker run --name=${CTN_NAME} ${INIT_PARAM[@]} ${IMG}:${TAG} init
}

xephyr() {
    XEPHYR_PARAM=(
        -d
        --privileged=true
        --cap-add=ALL
        --add-host=$HOST_NAME:$HOST_IP
        -e DISPLAY=$DISPLAY
        -e GITHUB_TOKEN=$GITHUB_TOKEN
        -e GITLAB_TOKEN=$GITLAB_TOKEN
        -e ZWM_DSP=:110
        -e ZWM_REZ=1920x1080
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
        -v $ZWM_TOP/.zwm/.ssh:$CTN_HOME/.ssh
        -v $ZWM_TOP/.zwm/.local:$CTN_HOME/.local
        -v $ZWM_TOP/.zwm/.config:$CTN_HOME/.config
        -v $ZWM_TOP/.zwm/.emacs.d:$CTN_HOME/.emacs.d
    )

    docker run --name=${CTN_NAME} ${XEPHYR_PARAM[@]} ${IMG}:${TAG} xephyr
}

zwm() {
    ZWM_DSP=${1:-$ZWM_DSP}
    RUN_PARAM=(
        -d
        --privileged=true
        --cap-add=ALL
        --add-host=$HOST_NAME:$HOST_IP
        -e DISPLAY=$ZWM_DSP
        -e GITHUB_TOKEN=$GITHUB_TOKEN
        -e GITLAB_TOKEN=$GITLAB_TOKEN
        -h $CTN_HOST
        -u $CTN_USER
        -p $SSH_PORT:22
        -v /dev:/dev
        -v /tmp/.X11-unix/X${ZWM_DSP_NUM}:/tmp/.X11-unix/X${ZWM_DSP_NUM}
        -v /var/run/docker.sock:/var/run/docker.sock
        -v /etc/security/limits.conf:/etc/security/limits.conf
        -v /etc/sysctl.conf:/etc/sysctl.conf
        -v $ZWM_ROOT:$CTN_HOME/zzstumpwm
        -v $ZWM_TOP/zzemacs:$CTN_HOME/zzemacs
        -v $ZWM_TOP/lab:$CTN_HOME/lab
        -v $ZWM_TOP/.zwm/.ssh:$CTN_HOME/.ssh
        -v $ZWM_TOP/.zwm/.local:$CTN_HOME/.local
        -v $ZWM_TOP/.zwm/.config:$CTN_HOME/.config
        -v $ZWM_TOP/.zwm/.emacs.d:$CTN_HOME/.emacs.d
    )

    docker run --name=${CTN_NAME} ${RUN_PARAM[@]} ${IMG}:${TAG} zwm
}

stop() {
    docker stop ${CTN_NAME} >/dev/null 2>&1
    docker rm ${CTN_NAME} >/dev/null 2>&1
}

logs() {
    docker logs ${CTN_NAME} 2>/dev/null
}

status() {
    echo "* Container list"
    docker ps | grep ${CTN_NAME}
    echo "* Xephyr list"
    ps -ef | grep Xephyr | grep -v grep
}

emacs() {
    EMACS_PARAM=(
        emacs
        -nw
    )

    docker exec -it ${EXEC_PARAM[@]} ${CTN_NAME} ${EMACS_PARAM[@]}
}

shell() {
    SHELL_PARAM=(
        bash
        -l
    )

    docker exec -it ${EXEC_PARAM[@]} ${CTN_NAME} ${SHELL_PARAM[@]}
}

ssh() {
    export TERM=xterm
    ssh -X -l ${SSH_USER} ${SSH_HOST} -p ${SSH_PORT}
}

build() {
    make -C dockerfiles $@
}

clean() {
    DSP_NUM=${1:-$ZWM_DSP_NUM}
    killall Xephyr >/dev/null 2>&1
    sudo rm -rf /tmp/.X${DSP_NUM}-lock
    sudo rm -rf /tmp/.X11-unix/X${DSP_NUM}
}

case $1 in
    dep )
        dep
        ;;
    prepare )
        prepare
        ;;
    init )
        init
        ;;
    xephyr )
        xephyr
        ;;
    zwm )
        shift
        zwm $@
        ;;
    stop )
        stop
        ;;
    logs )
        logs
        ;;
    status )
        status
        ;;
    emacs )
        emacs
        ;;
    shell )
        shell
        ;;
    ssh )
        ssh
        ;;
    build )
        shift
        build $@
        ;;
    clean )
        shift
        clean $@
        ;;
    * )
        echo "Usage: $(basename $0) {dep|prepare|init|zwm|stop|logs|status|emacs|shell|ssh|build|clean}"
        ;;
esac
