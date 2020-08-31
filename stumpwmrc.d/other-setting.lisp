;;;; other setting -*-lisp-*-
;;

(in-package :stumpwm)

;; process management
(defun zz/ps-exists (ps)
  (let ((f "ps -ef | grep ~S | grep -v -e grep -e stumpish | wc -l"))
    (< 0 (parse-integer (run-shell-command (format nil f ps) t)))))

(defun zz/start-command-ps (command &key options (background t))
  (unless (zz/ps-exists command)
    (run-shell-command
     (concat command " " options " " (when background "&")))))

(defun zz/kill-ps-command (command)
  (format nil "kill -9 `ps -ef | grep ~S | grep -v grep | awk '{print $2}'`"
          command))

(defun zz/kill-ps (command)
  (run-shell-command (zz/kill-ps-command command)))

(defun zz/gnome-term-command (name)
  "Start a gnome-terminal with an command session"
  (format nil "exec gnome-terminal --name=~a -t ~a -x ~a" name name name))

(defun zz/xterm-command (name)
  "Start a xterm with an command session"
  (format nil "exec xterm -e ~a" name))

(defun zz/urxvt-command (name)
  "Start a urxvt with an command session"
  (format nil "exec urxvt -e ~a" name))

(defun zz/yes-no-diag (query-string)
  "Presents a yes-no dialog to the user asking query-string.
Returns true when yes is selected"
  (equal :yes (cadr (select-from-menu (current-screen)
                            '(("No" :no) ("Yes" :yes))
                            query-string))))

;; startup run commands
(mapc
 #'(lambda (cmd)
     (apply #'zz/start-command-ps cmd))
 (list
  (list "xset" :options "b off")
  (list "xsetroot" :options "-cursor_name left_ptr -solid black -name root_window")
  (list "xautolock" :options "-time 15 -locker slock")
  (list "xprofile")
  ))
