Centos Install
==============

1. Install EPEL

        ### https://fedoraproject.org/wiki/EPEL#How_can_I_use_these_extra_packages.3F
        ## CentOS 6
        # yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
        ## CentOS 7
        # yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
        ## CentOS 8
        # yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
        
2. Install Desktop

        ## Install X
        # yum groupinstall 'X Window System'
        ## Install sbcl 1.4
        # yum install sbcl
