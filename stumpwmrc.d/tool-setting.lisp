;;;; tool setting -*-lisp-*-
;;

(in-package :zwm)

;; auto start swank server
(require 'swank)
(progn
  (defvar *server-running* nil
    "swank server running flag")
  (defvar *server-port* 4405
    "swank server port")
  (defcommand swank-toggle () ()
    "Toggle the swank server on/off"
    (if *server-running*
        (progn
          (swank:stop-server *server-port*)
          (echo-string
           (current-screen)
           "Stopping swank.")
          (setf *server-running* nil))
        (progn
          (swank:create-server :port *server-port*
                               :style swank:*communication-style*
                               :dont-close t)
          (echo-string
           (current-screen)
           "Starting swank. M-x slime-connect RET RET, then (in-package stumpwm).")
          (setf *server-running* t))))
  (defcommand swank-kill () ()
    "Kill swank server"
    (run-shell-command
     (format nil "kill -9 `lsof -i:~a | grep LISTEN | awk '{print $2}'`" *server-port*))))

;; screen shot
(require 'screenshot)

;; sound control
;; sudo apt install alsa-utils
(require 'amixer)
