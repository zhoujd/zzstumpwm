#!/bin/sh

# run `sudo fdisk -l` show disk info

echo "umount file system ..."
sudo umount /media/win7
sudo umount /media/work
sudo umount /media/study
sudo umount /media/backup

echo "mount local file system ..."
sudo mkdir -p /media/{win7,work,study,backup}

sudo mount /dev/sda1  /media/win7
sudo mount /dev/sda5  /media/work
sudo mount /dev/sda6  /media/study
sudo mount /dev/sda7  /media/backup

