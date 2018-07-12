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

        service sshd restart
        yum -y update xauth
        apt-get -y update xauth
        yum -y install xauth
        apt-get -y install xauth
