Remote access windows
======================

1. Open Windows remote desktop access, and make sure "Terminal Services" started.

        Default port:3389
        HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\Tds\tcp
        PortNumber:<1234>


2. Install package for linux
   
        $yum install rdesktop
        $yum install tsclient

        $rdesktop -f -a 16 119.0.0.100:1234
        $rdesktop -u yournape -p password -g 1024*720 192.168.0.2
        $man rdesktop

3. Build source http://www.rdesktop.org/#download

        # yum install libX11-devel libgssglue pcsc-lite 
        # yum install libgssglue-devel pcsc-lite-devel
        # tar zxvf rdesktop-1.8.2.tar.gz 
        # cd rdesktop-1.8.2 
        # ./configure 
        # make 
        # make install
