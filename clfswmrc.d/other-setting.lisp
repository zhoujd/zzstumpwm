;;;; other setting -*-lisp-*-
;;

(in-package :clfswm)

;; startup run commands
(mapc
 #'(lambda (cmd)
     (do-shell (car cmd) (cdr cmd)))
 (list
  (list "xset" "b off")
  (list "xsetroot" "-solid black")
  (list "xrdb" "-load" *zz-load-directory* "misc/.Xresources")
  ))
