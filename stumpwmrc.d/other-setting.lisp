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
  (format nil "kill -TERM `ps -ef | grep ~S | grep -v grep | awk '{print $2}'`"
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

;; prompt the user for an interactive command.
(defcommand colon1 (&optional (initial "")) (:rest)
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))

;; sudo command
(define-sudo-command reboot "reboot")
(define-sudo-command shutdown "shutdown -h now")
(define-sudo-command gnome-control-center "gnome-control-center")

;; run-or-raise
(def-run-or-raise-command firefox '(:class "Firefox"))

;; shell command
(defcommand current-window-info () ()
  "Shows the properties of the current window. These properties can be
used for matching windows with run-or-raise or window placement-merules."
  (let ((w (current-window))
        (nl (string #\NewLine))
        (*suppress-echo-timeout* t))
    (echo-string (current-screen)
                 (concat "class:    " (window-class w) nl
                         "instance: " (window-res w) nl
                         "type:     " (string (window-type w)) nl
                         "role:     " (window-role w) nl
                         "title:    " (window-title w) nl
                         "width:    " (format nil "~a" (window-width w)) nl
                         "height    " (format nil "~a" (window-height w))))))

(defcommand reinit () ()
  (run-commands "reload" "loadrc"))

(defcommand show-battery () ()
  (echo-string (current-screen) (run-shell-command "acpi" t)))

(defcommand uptime () ()
  (echo-string (current-screen) (run-shell-command "uptime" t)))

;; emacs in current group
(defcommand runemacs () ()
  (run-or-raise "emacs" '(:class "Emacs") nil nil))

;; urxvt in current group
(defcommand urxvt () ()
  (run-or-raise "urxvt" '(:class "URxvt") nil nil))

(defun yes-no-diag (query-string)
  "Presents a yes-no dialog to the user asking query-string.
Returns true when yes is selected"
  (equal :yes (cadr (select-from-menu (current-screen)
                            '(("No" :no) ("Yes" :yes))
                            query-string))))

;; close all windows
(defcommand delete-all () ()
  (dolist (screen *screen-list*)
    (dolist (group (stumpwm::screen-groups screen))
      (dolist (window (stumpwm::group-windows group))
        (stumpwm::delete-window window)))))

;; safe quit
(defcommand safe-quit () ()
  (let ((choice (yes-no-diag "Close all programs and quit stumpwm?")))
    (when choice
      (echo-string (current-screen) "Ending Session...")
      (delete-all)
      (run-hook *quit-hook*)
      (quit))))

;; startup run commands
(mapc
 #'(lambda (cmd)
     (apply #'start-command-ps cmd))
 (list
  (list "xset" :options "b off")
  (list "xsetroot" :options "-cursor_name left_ptr -solid black -name root_window")
  (list "VBoxClient-all")
  ))
