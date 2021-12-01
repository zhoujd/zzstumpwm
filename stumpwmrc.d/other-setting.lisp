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
  (let ((windows (stumpwm::group-windows (current-group))))
    (if (member win-cls (mapcar #'stumpwm::window-class windows) :test #'string-equal)
        (run-or-raise cmd `(:class ,win-cls) nil T)
        (run-or-raise cmd `(:class ,win-cls) T T))))

(defun run-or-pull-prefer-group (cmd win-cls)
  "Run or pull window, If tile group then pull window from other group"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-or-pull cmd `(:class ,win-cls))
      (run-or-pull cmd `(:class ,win-cls) nil nil)))

(defun show-message (location string)
  "show message, A gravity symbol. One of :center :top :right :bottom :left
     :top-right :top-left :bottom-right :bottom-left"
  (let ((old-location *message-window-gravity*))
    (setf *message-window-gravity* location)
    (echo string)
    (setf *message-window-gravity* old-location)))

(defun screen-snap (prefix)
  "screen snap support with command prefix"
  (let* ((directory "~/Pictures/screenshots/")
         (file-name (string-trim
                     '(#\Newline)
                     (run-shell-command "date +%b%d::%H%M%S.png" t)))
         (file-path (merge-pathnames directory file-name)))
    (ensure-directories-exist directory)
    (run-shell-command (format nil "~a ~a" prefix file-path) t)
    (when (probe-file file-path)
      (message "screenshot: ~a" file-path))))

(defun run-raise-pull-list (cmd props &key prompt
                                        (all-groups *run-or-raise-all-groups*)
                                        (all-screens *run-or-raise-all-screens*)
                                        (filter-pred stumpwm::*window-menu-filter*)
                                        (fmt *window-format*))
  "run-raise-pull-list opens a menu to choose either an existing window, or
execute a command. If no windows match props, the command is run. This is built
on run-or-raise"
  (let ((windows (stumpwm::find-matching-windows props all-groups all-screens)))
    (if (not windows)
        (run-shell-command cmd)
        (let* ((table  `(("NEW" ,cmd)
                         ,@(mapcar (lambda (el)
                                     (list (format-expand
                                            *window-formatters* fmt el)
                                           el))
                                   windows)))
               (result
                 (second
                  (select-from-menu (current-screen) table prompt
                                    1 nil filter-pred))))
          (cond ((not result)
                 '())
                ((stringp result)
                 (run-shell-command result))
                ((window-visible-p result)
                 (group-focus-window (current-group) result))
                (t
                 (stumpwm::pull-window result)))))))

;; startup run commands
(mapc
 #'(lambda (cmd)
     (apply #'start-command-ps cmd))
 (list
  (list "xset" :options "b off")
  (list "xsetroot" :options "-cursor_name left_ptr")
  (list "xcompmgr" :options "-C")
  (list "nitrogen" :options "--restore")
  (list "ulauncher" :options "--hide-window")
  (list "urxvtd" :options "-q -f -o")
  (list "unclutter")
  (list "redshift")
  (list "keynav")
  (list "dunst")
  (list "nm-applet")
  (list "blueman-applet")
  ))
