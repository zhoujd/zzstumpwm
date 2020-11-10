;;;; tool setting -*-lisp-*-
;;

(in-package :stumpwm)

;; auto start swank server
(require 'swank)
(defvar *zz/swank-server-running* nil "swank server flag")
(defvar *zz/swank-server-port* 4405 "swank server port")

(defun zz/swank-start-server ()
  (and (not *zz/swank-server-running*)
       (swank:create-server :port *zz/swank-server-port*
                            :dont-close t)
       (setf *zz/swank-server-running* t)))

(defun zz/swank-stop-server ()
  (and *zz/swank-server-running*
       (swank:stop-server *zz/swank-server-port*)
       (setf *zz/swank-server-running* nil)))

(defcommand zz/start-swank-server () ()
            "Start swank server."
            (zz/swank-start-server))

(defcommand zz/stop-swank-server () ()
            "Stop swank server."
            (zz/swank-stop-server))

;; start server
(zz/swank-start-server)

;; screen shot
(require 'screenshot)

;; sound control
;; sudo apt install alsa-utils
(require 'amixer)
