;;;; command setting -*-lisp-*-
;;

(in-package :stumpwm)

;; prompt the user for an interactive command.
(defcommand colon1 (&optional (initial "")) (:rest)
  "interactive command"
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))

;; sudo command
(define-sudo-command reboot "reboot")
(define-sudo-command shutdown "shutdown -h now")

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
  "reload stumpwm configure"
  (run-commands "reload" "loadrc"))

(defcommand show-battery () ()
  "show battery usage"
  (echo-string (current-screen) (run-shell-command "acpi" t)))

(defcommand uptime () ()
  "show uptime"
  (echo-string (current-screen) (run-shell-command "uptime" t)))

;; emacs in current group
(defcommand runemacs () ()
  "run emacs"
  (run-or-raise "emacs" '(:class "Emacs") nil nil))

;; print current group name
(defcommand gprint () ()
  "print current group name"
  (message "Current Group: ~A" (group-name (current-group))))

;; urxvt in current group
(defcommand urxvt () ()
  "run urxvt"
  (run-or-raise "urxvt" '(:class "URxvt") nil nil))

;; close all windows
(defcommand delete-all () ()
  "close all windows"
  (dolist (screen *screen-list*)
    (dolist (group (stumpwm::screen-groups screen))
      (dolist (window (stumpwm::group-windows group))
        (stumpwm::delete-window window)))))

;; safe delete
(defcommand safe-delete () ()
  "safe delete all windows"
  (let ((choice (yes-no-diag "Close all programs?")))
    (when choice
      (dolist (screen *screen-list*)
        (dolist (group (stumpwm::screen-groups screen))
          (dolist (window (stumpwm::group-windows group))
            (stumpwm::delete-window window)))))))

;; safe quit
(defcommand safe-quit () ()
  "safe quit"
  (let ((choice (yes-no-diag "Close all programs and quit stumpwm?")))
    (when choice
      (echo-string (current-screen) "Ending Session...")
      (delete-all)
      (run-hook *quit-hook*)
      (quit))))

;; resolution select
(defcommand resolution () ()
  "select resolution for stumpwm on vm"
  (let ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("1920x1080" :1920x1080)
                         ("1280x720"  :1280x720))
                       "Select resolution"))))
    (cond
      ((equal choice :1920x1080)
       (run-shell-command
        "xrandr --output `xrandr | grep primary | awk '{print $1}'` --mode 1920x1080"))
      ((equal choice :1280x720)
       (run-shell-command
        "xrandr --output `xrandr | grep primary | awk '{print $1}'` --mode 1280x720"))
      )))
