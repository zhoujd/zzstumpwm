;;;; tool setting -*-lisp-*-
;;

(in-package :stumpwm)

;; auto start swank server
(require 'swank)
(defvar *swank-server-p* nil "swant server flag")

(unless *swank-server-p*
  (swank:create-server :port 4405
                       :dont-close nil)
  (setf *swank-server-p* t))

;; screen shot
(require 'screenshot)

;; sound control
(require 'amixer)
