#!/bin/bash
#set -x

IMG=${IMG:-zz/ubuntu-20.04-xephyr}
TAG=${TAG:-dev}
CTN_PREFIX=${CTN_PREFIX:-xephyr}
CTN_NAME=${CTN_NAME:-$CTN_PREFIX-$TAG}

USER_UID=$(id -u)
USER_GID=$(id -g)

XR_DSP=:110
XR_REZ=1280x720

RUN_PARAM=(
    -d
    --privileged=true
    --cap-add=ALL
    -e DISPLAY=$DISPLAY
    -u $USER_UID:$USER_GID
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

logs() {
    docker logs ${CTN_NAME} 2>/dev/null
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
    logs )
        logs
        ;;
    status )
        status
        ;;
    * )
        echo "Usage: $(basename $0) {start|stop|logs|status}"
        ;;
esac
