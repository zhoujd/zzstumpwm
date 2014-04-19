Stumpwm Wiki
============

https://wiki.archlinux.org/index.php/Stumpwm

With SBCL (recommended, will run faster)
With Quicklisp (recommended)
Warning: Only use root to install SBCL and, if you want to, run "make install".

1. Install SBCL
     - pacman -S sbcl
2. Get Quicklisp at the Quicklisp website
     - curl -O http://beta.quicklisp.org/quicklisp.lisp
3. Load Quicklisp with SBCL
     - sbcl --load quicklisp.lisp
4. Install Quicklisp
     - (quicklisp-quickstart:install) or (quicklisp-quickstart:install :path "path/of/your/choice")
5. Add it to your SBCL init file
     - (ql:add-to-init-file)
6. Check for updates of Quicklisp (not needed if you have just downloaded it)
     - (ql:update-client)
7. Check for updates on Quicklisp
     - (ql:update-all-dists)
8. Install CLX and CL-PPCRE
     - (ql:quickload "clx")
     - (ql:quickload "cl-ppcre")
9. Quit SBCL with (quit)
10. Get the git version of StumpWM
     - git clone git://github.com/sabetts/stumpwm.git
11. Get into the stumpwm folder and start compiling
     - cd stumpwm && ./autogen.sh && ./configure && make
     - If you get an error stating "Component STUMPWM not found" try this:
     - env CL_SOURCE_REGISTRY=$PWD: sbcl --load make-image.lisp
12. You can optionally run "make install" as root.
     - If you get an error stating "Don't know how to REQUIRE STUMPWM" try this:
     - env CL_SOURCE_REGISTRY=$PWD: make install
13. Put the StumpWM binary path into your .xinit and have fun! :)

Optional: Install slime/swank for nonstop real-time hacking:

1. Install swank server
     - (ql:quickload "swank")
2. Install slime-helper
     - (ql:quickload "quicklisp-slime-helper")
3. Paste the following into your dot-emacs
     - (load (expand-file-name "/path/to/slime-helper.el"))
     - (setq inferior-lisp-program "sbcl")
4. Now put the following into your .stumpwmrc or just eval during your stumpwm-session
     - (require 'swank)
     - (swank:create-server)
5. Connect Emacs/Slime to your stumpwm-session using
     - M-x slime-connect
