Arch Linux install
==================

1. Internet connection

        # export http_proxy=http://proxy-prc.*****.com:911/
        # nano /etc/pacman.d/mirrorlist
          ## China ZZ
          Server = http://mirrors.163.com/archlinux/$repo/os/$arch
        # pacman -Syy

2. Fdisk for EFI

        # fdisk -l
        # fdisk /dev/sda
            > g  ## o for legacy grub
            > n
            > p
            > t  # 1
            > w

          300M      EFI    /dev/sda1
          15G       swap   /dev/sda2
          100%FREE  /      /dev/sda3

        # mkfs.fat -F32 /dev/sda1
        # mkfs.ext4 /dev/sda3

3. Install ARCH

        # mount /dev/sda3 /mnt
        # lsblk

        # pacstrap -i /mnt base base-devel
        # genfstab -U -p /mnt >> /mnt/etc/fstab
        # cat /mnt/etc/fstab

4. Setup NewOS

        # arch-chroot /mnt /bin/bash
        # nano /etc/locale.gen
          en_US.UTF-8 UTF-8
        # locale-gen
        # ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
        # hwclock --systohc --utc

        # pacman -S dosfstools grub efibootmgr os-probe mtools
        # mkdir /boot/EFI
        # mount /dev/sda1 /boot/EFI
        
        ## For legacy
        # grub-install /dev/sda
        
        ## For EFI
        # grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
        
        # cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
        # grub-mkconfig -o /boot/grub/grub.cfg

        # pacman -S openssh linux-headers linux-lts linux-lts-headers
        # pacman -S vim wget lsb-release bash-completion

        # echo arch-cl > /etc/hostname
        # nano /etc/hosts
          127.0.0.1  localhost
          127.0.1.1  arch-cl.localdomain  arch-cl

        # systemctl start  sshd
        # systemctl enable sshd
        # systemctl start  dhcpcd
        # systemctl enable dhcpcd

        # passwd

        # exit
        # umount -a

        # reboot

5. Setup sounds

        $ sudo pacman -S alsa-utils alsa-tools alsa-firmware alsa-oss alsa-lib alsa-plugins

6. Setup Desktop

        $ useradd -m -g users -G wheel -s /bin/bash zhoujd
        $ passwd zhoujd

        ### add zhoujd to sudousers
        # EDITOR=nano visudo
          %wheel ALL=(ALL) ALL
          Defaults env_keep += "http_proxy https_proxy ftp_proxy"

        $ sudo pacman -S xorg xorg-xinit
        $ sudo pacman -S git net-tools

7. Setup zzstumpwm

        $ git clone https://github.com/zhoujd/zzstumpwm.git

        $ cd zzstumpwm
        $ ./install.sh
        $ ./bin/sbcl-setup.sh
        $ ./bin/xinit-setup.sh

        $ cd third-party
        $ ./depends.sh arch
        $ ./install.sh arch

8. Setup zzemacs

        $ mkdir -p ~/work/build-emacs
        $ cp ~/work/build-emacs
        $ ~/zzemacs/bin/build-emacs.sh

        $ git clone https://github.com/zhoujd/zzemacs.git
        $ cd zzemacs
        $ ./install.sh

9. AUR install

        $ cd package_name
        $ less PKGBUILD
        $ less package_name.install
        $ makepkg -si

