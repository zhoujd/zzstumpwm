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
        
        ## Fix the Broken Icons
        ## Fix broken icons for Terminal and Thunar in xfce4 (Docky)
        $ sudo cp /usr/share/applications/* ~/.local/share/applications


6. gtk-update-icon-cache: The generated cache was invalid

        ## Icons with spaces:
        $ find -name "* *"
        $ find -name "gnome-control-center *svg" -exec rm {} +
        $ gtk-update-icon-cache --force /usr/share/icons/urutau-icons

7. switch workspace via key


        $ sudo apt install wmctrl
        $ wmctrl -s 1,0
        $ wmctrl -s 2,0

8. compton compositor

        $ sudo apt install compton compton-conf

9. window resize

        It's very easy, you can use Alt + right-click + drag.
