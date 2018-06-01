;;;; tool setting -*-lisp-*-
;;

(in-package :stumpwm)

;; auto start swank server
(require 'swank)
(swank-loader:init)
(defvar *swank-server-running* nil "swank server flag")
(defvar *swank-server-port* 4405 "swank server port")

(defun swank-start-server ()
  (and (not *swank-server-running*)
       (swank:create-server :port *swank-server-port*
                            :style swank:*communication-style*
                            :dont-close t)
       (setf *swank-server-running* t)))

(defun swank-stop-server ()
  (and *swank-server-running*
       (swank:stop-server *swank-server-port*)
       (setf *swank-server-running* nil)))

(defcommand start-swank-server () ()
            "Start swank server."
            (swank-start-server))

(defcommand stop-swank-server () ()
            "Stop swank server."
            (swank-stop-server))

;; start server
(swank-start-server)

;; screen shot
(require 'screenshot)

;; sound control
(require 'amixer)
