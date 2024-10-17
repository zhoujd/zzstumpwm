;;;; env setting -*-lisp-*-
;;

(in-package :zwm)

;; Enable external mouse scrolling in GTK+3 apps.
(setf (getenv "GDK_CORE_DEVICE_EVENTS") "1")

;; Create a listening socket and to contact the urxvtd
;; If the variable is missing,$HOME/.urxvt/urxvtd-<nodename> is used
;; $XDG_RUNTIME_DIR/urxvtd-$(hostname)
(setf (getenv "RXVT_SOCKET") (concat (getenv "XDG_RUNTIME_DIR") "/urxvtd-zwm"))
