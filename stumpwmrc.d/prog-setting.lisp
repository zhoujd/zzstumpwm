;;;; programe setting -*-lisp-*-
;;

(in-package :zwm)

(defcommand bpython () ()
  "bpython"
  (run-shell-command "exec urxvt -e bpython"))

(defcommand swank-start () ()
  "Start swank server."
  (swank-start-server))

(defcommand swank-stop () ()
  "Stop swank server."
  (swank-stop-server))

(defcommand swank-toggle () ()
  "toggle swank server."
  (if *swank-server-running*
      (swank-stop-server)
      (swank-start-server)))

(defcommand debug-enable () ()
  "debug enable"
  (setf stumpwm::*debug-level* 10))

(defcommand debug-disable () ()
  "debug disable"
  (setf stumpwm::*debug-level* 0))

;; Ubuntu: sudo apt install rlwrap
(defcommand stumpish () ()
  "run stumpish"
  (run-shell-command
   (format nil "urxvt -e ~a"
           (merge-pathnames "bin/stumpish" *zz-load-directory*))))

(defcommand stumpwm-manual () ()
  "run stumpwm info manual"
  (run-shell-command
   (format nil "urxvt -e info ~a"
           (merge-pathnames "doc/stumpwm.info" *zz-load-directory*))))
