;;;; tool setting -*-lisp-*-
;;

(in-package :zwm)

;; auto start swank server
(require 'swank)

(defvar *swank-server-running* nil
  "swank server flag")

(defvar *swank-server-port* 4405
  "swank server port")

(defun swank-start-server ()
  "swank start server"
  (when (not *swank-server-running*)
    (swank:create-server :port *swank-server-port*
                         :dont-close t)
    (setf *swank-server-running* t)))

(defun swank-stop-server ()
  "swank stop server"
  (when *swank-server-running*
    (swank:stop-server *swank-server-port*)
    (setf *swank-server-running* nil)))

(defun swank-port-exists (port)
  "swank port exists"
  (let ((f (format nil "lsof -i:~a | grep LISTEN | awk {print $2}" port)))
    (plusp (length (run-shell-command f t)))))

(defun swank-restart-server ()
  "swank restart server"
  (ignore-errors
   (swank:stop-server *swank-server-port*))
  (swank:create-server :port *swank-server-port*
                       :dont-close t)
  (setf *swank-server-running* t))

;; restart server
(swank-restart-server)

;; screen shot
(require 'screenshot)

;; sound control
;; sudo apt install alsa-utils
(require 'amixer)
