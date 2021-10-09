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

(defun pactl-mic-volume (step)
  "pactl mic volume change as step"
  (let ((source "@DEFAULT_SOURCE@"))
    (run-shell-command (format nil "pactl set-source-mute ~a 0" source))
    (run-shell-command (format nil "pactl set-source-volume ~a ~a" source step))))

(defun rat-click (num)
  "Simulate mouse clicks - 1:Left click, 2:Middle click, 3: Right click,
4:Scroll wheel up, 5:Scroll wheel down"
  (format nil "exec xdotool click ~a" num))

(defun run-or-raise-prefer-group (cmd win-cls)
  "If there are windows in the same class, cycle in those. Otherwise call
run-or-raise with group search t."
  (let ((windows (group-windows (current-group))))
    (if (member win-cls (mapcar #'window-class windows) :test #'string-equal)
        (run-or-raise cmd `(:class ,win-cls) nil T)
        (run-or-raise cmd `(:class ,win-cls) T T))))

(defun run-raise-or-list (cmd props &optional (all-groups *run-or-raise-all-groups*)
                                      (all-screens *run-or-raise-all-screens*))
  "Run the shell command, {cmd}, unless an existing window
    matches the {props} as described in run-or-raise. If {props} have multiple matches, generate a window list"
  (labels
      ;; Raise the window win and select its frame.  For now, it
      ;; does not select the screen.
      ((goto-win (win)
         (let* ((group (window-group win))
                (frame (window-frame win))
                (old-frame (tile-group-current-frame group)))
           (focus-all win)
           (unless (eq frame old-frame)
             (show-frame-indicator group)))))
    (let ((matches (find-matching-windows props all-groups all-screens)))
      (case (length matches)
        (0 (run-shell-command cmd))
        (1 (if (eq (type-of (window-group (car matches))) 'float-group)
               (focus-all (car matches))
               (goto-win (car matches))))
        (t (windowlist *window-format* matches))))))

;; startup run commands
(mapc
 #'(lambda (cmd)
     (apply #'start-command-ps cmd))
 (list
  (list "xset" :options "b off")
  (list "xsetroot" :options "-cursor_name left_ptr")
  (list "nitrogen" :options "--restore")
  (list "xcompmgr" :options "-C")
  (list "ulauncher" :options "--hide-window")
  (list "keynav")
  (list "redshift")
  (list "dunst")
  (list "nm-applet")
  (list "blueman-applet")
  ))
