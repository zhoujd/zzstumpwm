;;;; tool setting -*-lisp-*-
;;

(in-package :zwm)

;; auto start swank server
(require 'swank)
(progn
  (defvar *swank-server-running* nil
    "swank server flag")
  (defvar *swank-server-port* 4405
    "swank server port")
  (defun swank-start-server ()
    (and (not *swank-server-running*)
         (swank:create-server :port *swank-server-port*
                              :dont-close t)
         (setf *swank-server-running* t)))
  (defun swank-stop-server ()
    (and *swank-server-running*
         (swank:stop-server *swank-server-port*)
         (setf *swank-server-running* nil)))
  ;; start server
  (swank-start-server))

;; screen shot
(require 'screenshot)

;; sound control
;; sudo apt install alsa-utils
(require 'amixer)
