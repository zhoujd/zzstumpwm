SSH forward
===========

1. On the server

        $ sudo vim /etc/ssh/sshd_config
          AllowTcpForwarding yes
          X11Forwarding yes
          X11DisplayOffset 10
          X11UseLocalhost yes

2. Restart the sshd daemon:

        $ sudo service sshd restart
        $ sudo yum -y update xauth
        $ sudo apt -y update xauth
        $ sudo yum -y install xauth
        $ sudo apt -y install xauth
