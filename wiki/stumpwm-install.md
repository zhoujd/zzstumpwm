Stumpwm
=======

# Install SBCL and Quicklisp
    With SBCL (recommended, will run faster)
    With Quicklisp (recommended)
    Warning: Only use root to install SBCL and, if you want to, run "make install".
    - https://wiki.archlinux.org/index.php/Stumpwm

## Install SBCL

     - sudo apt-get install sbcl

## Get Quicklisp at the Quicklisp website

     - curl -O http://beta.quicklisp.org/quicklisp.lisp

## Load Quicklisp with SBCL

     - sbcl --load quicklisp.lisp

## Install Quicklisp

     - (quicklisp-quickstart:install) or (quicklisp-quickstart:install :path "path/of/your/choice")

## Add it to your SBCL init file

     - (ql:add-to-init-file)

## Check for updates of Quicklisp (not needed if you have just downloaded it)

     - (ql:update-client)

## Check for updates on Quicklisp

     - (ql:update-all-dists)

## Install CLX and CL-PPCRE

     - (ql:quickload "clx")
     - (ql:quickload "cl-ppcre")

## Quit SBCL with (quit)
## Get the git version of StumpWM

     - git clone git://github.com/sabetts/stumpwm.git

## Get into the stumpwm folder and start compiling

     - cd stumpwm && ./autogen.sh && ./configure && make
     - If you get an error stating "Component STUMPWM not found" try this:
     - env CL_SOURCE_REGISTRY=$PWD: sbcl --load make-image.lisp

## You can optionally run "make install" as root

     - If you get an error stating "Don't know how to REQUIRE STUMPWM" try this:
     - env CL_SOURCE_REGISTRY=$PWD: make install

## Put the StumpWM binary path into your .xinit and have fun! :)

# Optional: Install slime/swank for nonstop real-time hacking:
## Install swank server

     - (ql:quickload "swank")

## Install slime-helper

     - (ql:quickload "quicklisp-slime-helper")

## Paste the following into your dot-emacs

     - (load (expand-file-name "/path/to/slime-helper.el"))
     - (setq inferior-lisp-program "sbcl")

## Now put the following into your .stumpwmrc or just eval during your stumpwm-session

     - (require :swank)
     - (swank:create-server)

## Connect Emacs/Slime to your stumpwm-session using

     - M-x slime-connect
