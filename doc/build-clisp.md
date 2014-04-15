Build clisp
===========

1. Get source form <http://ftp.gnu.org/pub/gnu/clisp/>
2. Install follow package

        mkdir tools; cd tools; prefix=`pwd`/x86_64-unknown-linux-gnu
        wget http://ftp.gnu.org/pub/gnu/libsigsegv/libsigsegv-2.8.tar.gz
        tar xfz libsigsegv-2.8.tar.gz
        cd libsigsegv-2.8
        ./configure --prefix=${prefix} && make && make check && make install
        cd ../..
        rm -f src/config.cache
        ./configure --with-libsigsegv-prefix=${prefix}

        cd src
        make
        sudo make install

    on ubuntu

        sudo apt-get install libffi-dev
        sudo apt-get install libreadline-dev


