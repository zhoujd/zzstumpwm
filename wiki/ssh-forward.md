SSH forward
===========

1. On the server

        $ vim /etc/ssh/sshd_config

        AllowAgentForwarding yes
        AllowTcpForwarding yes
        X11Forwarding yes
        X11DisplayOffset 10
        X11UseLocalhost no
        
2. Restart the sshd daemon:

        $ sudo service sshd restart
        $ sudo yum -y update xauth
        $ sudo apt-get -y update xauth
        $ sudo yum -y install xauth
        $ sudo apt-get -y install xauth
