;;;; other setting

(in-package :stumpwm)

(defun cat (&rest strings)
    (apply 'concatenate 'string strings))

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

;; sudo command
(define-sudo-command reboot "reboot")
(define-sudo-command shutdown "shutdown -h now")
(define-sudo-command gnome-control-center "gnome-control-center")

;; run-or-raise
(def-run-or-raise-command firefox '(:class "Firefox"))

;; shell command
(defcommand display-current-window-info () ()
  "Shows the properties of the current window. These properties can be
used for matching windows with run-or-raise or window placement
-merules."
  (let ((w (current-window))
        (*suppress-echo-timeout* t)
        (nl (string #\NewLine)))
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

(defcommand nm-applet () ()
  (start-command-ps "nm-applet" :options "--sm-disable"))

(defcommand show-battery () ()
  (echo-string (current-screen) (run-shell-command "acpi" t)))

(defcommand uptime () ()
  (echo-string (current-screen) (run-shell-command "uptime" t)))


;; startup run commands
(run-shell-command "xsetroot -solid black")
(start-command-ps "gnome-settings-daemon")
(start-command-ps "gnome-power-manager")
(start-command-ps "gnome-valume-manager")
(nm-applet)
