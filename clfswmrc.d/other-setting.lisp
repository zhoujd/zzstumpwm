;;;; other setting -*-lisp-*-
;;

(in-package :clfswm)

;; startup run commands
(mapc
 #'(lambda (cmd)
     (do-execute (car cmd) (cdr cmd)))
 (list
  (list "/usr/bin/xset" "b off")
  (list "/usr/bin/xsetroot" "-solid black")
  (list "/usr/bin/xrdb" "-load" *zz-load-directory* "misc/.Xresources")
  ))
