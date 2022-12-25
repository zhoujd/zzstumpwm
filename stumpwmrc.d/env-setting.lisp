;;;; env setting -*-lisp-*-
;;

(in-package :zwm)

;; external mouse scrolling in GTK+3 apps.
(setf (getenv "GDK_CORE_DEVICE_EVENTS") "1")
