;;;; programe setting -*-lisp-*-
;;

(in-package :zwm)

(defcommand colon1 (&optional (initial "")) (:rest)
  "colon1"
  (let ((cmd (read-one-line (current-screen) "run: " :initial-input initial)))
    (unless cmd
      (throw 'error :abort))
    (when (plusp (length cmd))
      (stumpwm::eval-command cmd t))))

(defcommand eval1 (&optional (initial "")) (:rest)
  "eval1"
  (let ((line (read-one-line (current-screen) "eval: " :initial-input initial)))
    (unless line
      (throw 'error :abort))
    (when (plusp (length line))
      (stumpwm::eval-line line))))

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
