;;;; common setting -*-lisp-*-
;;

(in-package :clfswm)

;; auto start swank server
(require 'swank)
(defvar *swank-server-p* nil "swant server flag")

(unless *swank-server-p*
  (swank:create-server :dont-close t :port 4405)
  (setf swank:*use-dedicated-output-stream* nil)
  (setf *swank-server-p* t))

;; remove hello window
(setf *init-hook* (remove 'display-hello-window *init-hook*))
