#!/bin/sh

cd /etc/grub.d/
sudo mv 30_os-prober 05_os-prober
sudo update-grub

echo finish ...
