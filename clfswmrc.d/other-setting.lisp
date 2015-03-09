;;;; other setting -*-lisp-*-
;;

(in-package :clfswm)


(defun run-shell-command (cmd)
  (do-execute (car cmd) (cdr cmd)))

(mapc
 #'run-shell-command
 (list
  (list "/usr/bin/xrdb" "-load " *zz-load-directory* "misc/.Xresources")
  ))

(do-execute "/usr/bin/xrdb" (list "-load " *zz-load-directory* "misc/.Xresources"))
