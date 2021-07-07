;;;; env setting -*-lisp-*-
;;

(in-package :zwm)

;; bugfix for scrolling doesn't work with an external mouse in GTK+3 apps.
(setf (getenv "GDK_CORE_DEVICE_EVENTS") "1")
