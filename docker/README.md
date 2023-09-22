README
======

## What is this project

    ## This docker project depends on zzemacs (https://github.com/zhoujd/zzemacs)
    ## Please build zzemacs docker images before build this image
    ## Xephyr is needed for virtual display

## How to run ZWM in remote docker container

    ## Step 1
    ## Make sure Xephyr is installed on local
    $ sudo apt install xserver-xephyr

    ## Step 2
    ## Login in remote with X11 forward support on local
    $ ssh -X user@remote-host

    ## Step 3
    ## Prepare virtual display
    $ git clone https://github.com/zhoujd/zzstumpwm.git
    $ cd zzstumpwm/docker
    $ ./run.sh build
    $ ./run.sh prepare

    ## Step 4
    ## Start ZWM service in docker
    $ ./run.sh start
    $ ./run.sh status

    ## Step 5
    ## Check ZWM on virtual display about 1 mintue later
    ## Because ZWM needs about 1 minitue to ready

    ## Step 6
    ## Stop ZWM in docker
    $ ./run.sh stop
    $ ./run.sh clean
