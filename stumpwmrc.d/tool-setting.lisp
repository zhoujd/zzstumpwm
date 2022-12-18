;;;; tool setting -*-lisp-*-
;;

(in-package :zwm)

;; swank server
#-swank
(require 'swank)
(defvar *swank-server-running* nil "swank server running flag")
(defvar *swank-server-port* 4405 "swank server port")

(defcommand swank-toggle () ()
  "Toggle the swank server on/off"
  (if *swank-server-running*
      (progn
        (swank:stop-server *swank-server-port*)
        (echo-string
         (current-screen)
         "Stopping swank.")
        (setf *swank-server-running* nil))
      (progn
        (swank:create-server :port *swank-server-port*
                             :style swank:*communication-style*
                             :dont-close t)
        (echo-string
         (current-screen)
         "Starting swank. M-x slime-connect RET RET, then (in-package stumpwm).")
        (setf *swank-server-running* t))))

(defcommand swank-quit () ()
  "Kill swank server"
  (run-shell-command
   (format nil "kill -9 `lsof -i:~a | grep LISTEN | awk '{print $2}'`" *swank-server-port*)))

;; screen shot
#-screenshot
(require 'screenshot)

;; sound control
#-amixer
(require 'amixer)
