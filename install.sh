#!/bin/sh

CURRENT_DIR=`pwd`


echo "install stumpwm start ..."

rm -f ~/.stumpwmrc
ln -s $CURRENT_DIR/.stumpwmrc ~/.stumpwmrc

cat > ~/.sbclrc <<EOF
;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "${CURRENT_DIR}/quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))
EOF


echo "install stumpwm end ..."
