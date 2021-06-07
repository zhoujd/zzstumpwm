;;;; common setting -*-lisp-*-
;;

(in-package :clfswm)

;; remove hello window
(setf *init-hook* (remove 'display-hello-window *init-hook*))
