#!/bin/sh

# run `sudo fdisk -l` show disk info

echo "umount file system ..."
sudo umount /media/win7
sudo umount /media/work
sudo umount /media/study
sudo umount /media/backup

echo "mkdir on /media"
sudo mkdir -p /media/{win7,work,study,backup}

echo "mount local file system ..."
sudo mount -r  -t ntfs /dev/sda1  /media/win7
sudo mount -rw -t ntfs /dev/sda5  /media/work
sudo mount -rw -t ntfs /dev/sda6  /media/study
sudo mount -rw -t ntfs /dev/sda7  /media/backup
