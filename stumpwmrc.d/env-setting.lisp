;;;; env setting -*-lisp-*-
;;

(in-package :zwm)

;; set DESKTOP_SESSION variable
(setf (getenv "DESKTOP_SESSION") "stumpwm")

;; bugfix for scrolling doesn't work with an external mouse in GTK+3 apps.
(setf (getenv "GDK_CORE_DEVICE_EVENTS") "1")
