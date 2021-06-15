Arch Linux install
==================

## Internet connection

    # export http_proxy=http://proxy-prc.*****.com:911/
    # nano /etc/pacman.d/mirrorlist
      ## China ZZ
      Server = http://mirrors.163.com/archlinux/$repo/os/$arch
    # pacman -Syy

## Fdisk for EFI

    # fdisk -l
    # fdisk /dev/sda
        > g  ## o for legacy grub
        > p
        > n
        > 1
        > enter
        > +300M
        > t
        > 1   ## linux EFI
        > w

        > n
        > 2
        > enter
        > +16G
        > t
        > 19  ## linux swap
        > w

        > n
        > 3
        > enter
        > enter
        > w

      300M      EFI    /dev/sda1
      16G       swap   /dev/sda2
      100%FREE  /      /dev/sda3

    # mkfs.fat -F32 /dev/sda1
    # mkswap /dev/sda2
    # mkfs.ext4 /dev/sda3

## Install Arch

    # mount /dev/sda3 /mnt
    # lsblk

    # pacstrap -i /mnt base base-devel
    # genfstab -U -p /mnt >> /mnt/etc/fstab
    # cat /mnt/etc/fstab

## Setup NewOS
### EFI

    # arch-chroot /mnt /bin/bash
    # nano /etc/locale.gen
      en_US.UTF-8 UTF-8
    # locale-gen
    # ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    # date -s mm/dd/YYYY
    # date -s hh:mm:ss
    # hwclock --systohc --utc

    # pacman -S dosfstools grub efibootmgr os-prober mtools

    # mkdir /boot/EFI
    # mount /dev/sda1 /boot/EFI
    # grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

    # cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
    # grub-mkconfig -o /boot/grub/grub.cfg

    # pacman -S linux-headers linux-lts linux-lts-headers
    # grub-mkconfig -o /boot/grub/grub.cfg

    # pacman -S vim wget lsb-release bash-completion
    # pacman -S rxvt-unicode urxvt-perls

    # echo arch-cl > /etc/hostname
    # nano /etc/hosts
      127.0.0.1  localhost
      127.0.1.1  arch-cl.localdomain  arch-cl

    # pacman -S openssh
    # systemctl start  sshd
    # systemctl enable sshd
    # systemctl start  dhcpcd
    # systemctl enable dhcpcd

    # passwd

    # exit
    # umount -a

    # reboot

### Legacy

    # grub-install /dev/sda --recheck

## Setup desktop

    $ useradd -m -g users -G wheel -s /bin/bash zhoujd
    $ passwd zhoujd

    # EDITOR=nano visudo
      %wheel ALL=(ALL) ALL
      Defaults env_keep+="http_proxy https_proxy ftp_proxy no_proxy"

    $ sudo pacman -S xorg xorg-xinit

    $ sudo pacman -Ss xf86-video
    $ sudo pacman -S xf86-video-intel

    $ sudo pacman -S git net-tools xfce4
    $ sudo pacman -S mercurial python python2
    $ sudo pacman -S the_silver_searcher

    $ sudo pacman -S lightdm lightdm-gtk-greeter
    $ sudo systemctl start lightdm.service
    $ sudo systemctl enable lightdm.service

## Setup sound

    $ sudo pacman -S alsa-utils alsa-tools alsa-firmware alsa-oss alsa-lib alsa-plugins

## AUR install

    $ cd package_name
    $ less PKGBUILD
    $ less package_name.install
    $ makepkg -si

## Swap file

    # fallocate -l 8G /swapfile
    # chmod 600 /swapfile
    # mkswap /swapfile
    # echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
    # cat /etc/fstab

## How to fix "unable to lock database" error

    $ sudo rm /var/lib/pacman/db.lck

## X11 forwarding

    $ sudo vim /etc/ssh/sshd_config
      AllowTcpForwarding yes
      X11Forwarding yes
      X11DisplayOffset 10
      X11UseLocalhost yes

    $ sudo systemctl restart sshd
