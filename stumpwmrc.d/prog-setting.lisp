;;;; programe setting -*-lisp-*-
;;

(in-package :zwm)

(defcommand colon1 (&optional (initial "")) (:rest)
  "colon1"
  (let* ((screen (current-screen))
         (prompt (stumpwm::all-commands))
         (input (completing-read screen ": " prompt :initial-input initial)))
    (unless input
      (throw 'error :abort))
    (when (plusp (length input))
      (stumpwm::eval-command input t))))

(defcommand eval1 (&optional (initial "")) (:rest)
  "eval1"
  (let ((line (read-one-line (current-screen) "> " :initial-input initial)))
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
