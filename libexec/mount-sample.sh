#!/bin/sh

# run `sudo fdisk -l` show disk info

echo "umount file system ..."
sudo umount /media/winC
sudo umount /media/winD
sudo umount /media/winE
sudo umount /media/winF

echo "mkdir on /media"
sudo mkdir -p /media/{winC,winD,winE,winF}

echo "mount local file system ..."
sudo mount -r  -t ntfs-3g /dev/sda1  /media/winC
sudo mount -rw -t ntfs-3g /dev/sda5  /media/winD
sudo mount -rw -t ntfs-3g /dev/sda6  /media/winE
sudo mount -rw -t ntfs-3g /dev/sda7  /media/winF
