;;;; other setting -*-lisp-*-
;;

(in-package :stumpwm)

;; process management
(defun ps-exists (ps)
  (let ((f "ps -ef | grep ~S | grep -v -e grep -e stumpish | wc -l"))
    (< 0 (parse-integer (run-shell-command (format nil f ps) t)))))

(defun start-command-ps (command &key options (background t))
  (unless (ps-exists command)
    (run-shell-command
     (concat command " " options " " (when background "&")))))

(defun kill-ps-command (command)
  (format nil "kill -9 `ps -ef | grep ~S | grep -v grep | awk '{print $2}'`"
          command))

(defun kill-ps (command)
  (run-shell-command (kill-ps-command command)))

(defun gnome-term-command (name)
  "Start a gnome-terminal with an command session"
  (format nil "exec gnome-terminal --name=~a -t ~a -x ~a" name name name))

(defun xterm-command (name)
  "Start a xterm with an command session"
  (format nil "exec xterm -e ~a" name))

(defun urxvt-command (name)
  "Start a urxvt with an command session"
  (format nil "exec urxvt -e ~a" name))

(defun yes-no-diag (query-string)
  "Presents a yes-no dialog to the user asking query-string.
Returns true when yes is selected"
  (equal :yes (cadr (select-from-menu (current-screen)
                            '(("No" :no) ("Yes" :yes))
                            query-string))))

;; startup run commands
(mapc
 #'(lambda (cmd)
     (apply #'start-command-ps cmd))
 (list
  (list "/usr/bin/xset" :options "b off")
  (list "/usr/bin/xsetroot" :options "-cursor_name left_ptr -solid black -name root_window")
  (list "/usr/bin/xautolock" :options "-time 15 -locker i3lock-nice")
  (list "/usr/bin/xprofile")
  (list "/usr/bin/emacs" :options "--daemon")
  ))
