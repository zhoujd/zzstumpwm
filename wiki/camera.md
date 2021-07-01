Camera
======

## Disable Built-in webcam in Linux

    $ sudo lsmod | grep uvcvideo
    uvcvideo               98304  0
    videobuf2_vmalloc      20480  1 uvcvideo
    videobuf2_v4l2         24576  1 uvcvideo
    videobuf2_common       49152  2 videobuf2_v4l2,uvcvideo
    videodev              225280  3 videobuf2_v4l2,uvcvideo,videobuf2_common
    mc                     53248  5 videodev,snd_usb_audio,videobuf2_v4l2,uvcvideo,videobuf2_common

    $ sudo nano /etc/modprobe.d/blacklist.conf
    ##Disable webcam
    blacklist uvcvideo
