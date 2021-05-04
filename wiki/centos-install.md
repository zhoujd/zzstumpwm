Centos Install
==============

1. Install EPEL

        ### https://fedoraproject.org/wiki/EPEL#How_can_I_use_these_extra_packages.3F
        ## CentOS 6
        $ sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
        ## CentOS 7
        $ sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
        ## CentOS 8
        $ sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

2. Install Desktop

        ## Install X
        $ sudo yum groupinstall 'X Window System'
        ## Install sbcl 1.4
        $ sudo yum install sbcl

3. Install Git 2.22.4

        $ sudo yum install \
            https://repo.ius.io/ius-release-el7.rpm \
            https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

        $ sudo yum remove git*
        $ sudo yum -y install  git222-all
        $ git version
          git version 2.22.4
