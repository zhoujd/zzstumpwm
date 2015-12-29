#!/bin/sh

CURRENT_DIR=`pwd`

echo "install stumpwm start ..."

## Set configure file and qucklisp
rm -f ~/.stumpwmrc
rm -f ~/quicklisp
ln -s $CURRENT_DIR/.stumpwmrc ~/.stumpwmrc
ln -s $CURRENT_DIR/quicklisp ~/quicklisp

## Set SBCL script
cat > ~/.sbclrc <<EOF
;;;; -*- Lisp -*-
;;; ASDF configure
(require :asdf)
(mapc
 #'(lambda (path)
     (let ((full-path (merge-pathnames path (user-homedir-pathname))))
       (when (probe-file full-path)
         (pushnew full-path asdf:*central-registry* :test #'equal))))
 '(
   "lisp/system/"
   ))

;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))
EOF

echo "install stumpwm end ..."
