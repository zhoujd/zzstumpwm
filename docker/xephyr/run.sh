#!/bin/bash
#set -x

IMG=${IMG:-zz/ubuntu-20.04-xephyr}
TAG=${TAG:-dev}
CTN_PREFIX=${CTN_PREFIX:-xephyr}
CTN_NAME=${CTN_NAME:-$CTN_PREFIX-$TAG}

USER_UID=$(id -u)
USER_GID=$(id -g)

XR_DSP=:120
XR_REZ=1280x720

RUN_PARAM=(
    -d
    --privileged=true
    --cap-add=ALL
    -e DISPLAY=$DISPLAY
    -u $USER_UID:$USER_GID
    -v /etc/passwd:/etc/passwd
    -v /etc/group:/etc/group
    -v /tmp/.X11-unix:/tmp/.X11-unix
)

XEPHYR_PARAM=(
    Xephyr
    $XR_DSP
    -ac
    -br
    -screen $XR_REZ
    -resizeable
)

start() {
    docker run --name=${CTN_NAME} ${RUN_PARAM[@]} ${IMG}:${TAG} ${XEPHYR_PARAM[@]}
}

stop() {
    docker stop ${CTN_NAME} >/dev/null 2>&1
    docker rm ${CTN_NAME} >/dev/null 2>&1
}

shell() {
    docker exec -it ${CTN_NAME} bash
}

logs() {
    docker logs ${CTN_NAME}
}

status() {
    echo "* Container list"
    docker ps | grep ${CTN_NAME}
    echo "* Xephyr list"
    ps -ef | grep Xephyr | grep -v grep
}

case $1 in
    build )
        make
        ;;
    start )
        start
        ;;
    stop )
        stop
        ;;
    shell )
        shell
        ;;
    logs )
        logs
        ;;
    status )
        status
        ;;
    clean )
        shift
        clean $@
        ;;
    * )
        echo "Usage: $(basename $0) {start|stop|shell|logs|status}"
        ;;
esac
