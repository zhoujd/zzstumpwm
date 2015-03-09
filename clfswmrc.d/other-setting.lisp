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
  (list "bluetooth-applet" "--sm-disable")
  (list "nm-applet" "--sm-disable")
  (list "gnome-settings-daemon")
  (list "gnome-power-manager")
  (list "gnome-valume-manager")
  (list "gnome-keyring-daemon" "--start --components=gpg,pkcs11,secrets,ssh")
  ))
