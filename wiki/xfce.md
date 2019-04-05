Xfce
====

1. Install Xfce

        $ sudo apt install -y xubuntu-desktop
        
        $ sudo apt install -y expect
        $ cat <<EOF | expect
        set timeout -1
        spawn sudo apt install -y xubuntu-desktop
        expect "Default display manager: "
        send "lightdm\n"
        expect eof
        EOF 
       
        $ sudo reboot

2. Remove Xfce

        $ sudo apt remove -y xubuntu-desktop xfdesktop4 xfce4-* libxfce4-* lightdm
        $ sudo apt autoremove -y
        $ sudo apt install --reinstall -y gdm3
        $ sudo reboot

3. Default wallpaper folder

        $ cd /usr/share/xfce4/backdrops

4. Clock format
         
        Thu Apr 4, 3:24 PM
        %a %b %e, %l:%M %p

5. Docky & launchy

        $ sudo apt install docky
        $ gconftool-2 --type Boolean --set /apps/docky-2/Docky/Items/DockyItem/ShowDockyItem False
        
        $ sudo apt-get install launchy launchy-plugins
