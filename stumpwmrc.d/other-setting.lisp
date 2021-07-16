;;;; other setting -*-lisp-*-
;;

(in-package :zwm)

;; process management
(defun ps-exists (ps)
  (let ((f "ps -ef | grep ~S | grep -v -e grep -e stumpish | wc -l"))
    (< 0 (parse-integer (run-shell-command (format nil f ps) t)))))

(defun start-command-ps (command &key options (background t))
  (unless (ps-exists command)
    (run-shell-command
     (concat command " " options " " (when background "&")))))

(defun emacs-ds-exists ()
  (let ((f "ps -e -o args | grep -E 'emacs --(fg-|)daemon' | wc -l"))
    (< 0 (parse-integer (run-shell-command f t)))))

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

(defun random-string (length)
  "Return a random string with LENGTH characters."
  (let ((alphabet (concat
                   "abcdefghijklmnopqrstuvwxyz"
                   "0123456789"
                   "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
        (string (make-string length)))
    (map-into string (lambda (char)
                       (declare (ignore char))
                       (aref alphabet (random (length alphabet))))
              string)))

(defun pactl-volume (step)
  "pactl volume change as step"
  (let ((sink "@DEFAULT_SINK@"))
    (run-shell-command (format nil "pactl set-sink-mute ~a 0" sink))
    (run-shell-command (format nil "pactl set-sink-volume ~a ~a" sink step))))

;; simulate mouse clicks
;; 1 – Left click
;; 2 – Middle click
;; 3 – Right click
;; 4 – Scroll wheel up
;; 5 – Scroll wheel down
(defun rat-click (num)
  (format nil "exec xdotool click ~a" num))

;; startup run commands
(mapc
 #'(lambda (cmd)
     (apply #'start-command-ps cmd))
 (list
  (list "xset" :options "b off")
  (list "xsetroot" :options "-cursor_name left_ptr")
  (list "nitrogen" :options "--restore")
  (list "xcompmgr" :options "-C")
  (list "keynav")
  (list "redshift")
  (list "albert")
  (list "nm-applet")
  (list "blueman-applet")
  ))
