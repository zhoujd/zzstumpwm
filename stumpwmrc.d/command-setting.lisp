;;;; command setting -*-lisp-*-
;;

(in-package :stumpwm)

;; prompt the user for an interactive command.
(defcommand colon1 (&optional (initial "")) (:rest)
  "interactive command"
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))

;; webjumps q=query+goes+here
(make-web-jump "google" "firefox https://www.google.com/search?q=")
(make-web-jump "bing" "firefox https://www.bing.com/search?q=")
(make-web-jump "wikipedia" "firefox https://en.wikipedia.org/w/index.php?search=")

;; sudo command
(define-sudo-command reboot "reboot")
(define-sudo-command shutdown "shutdown -h now")

;; run-or-raise
(def-run-or-raise-command firefox '(:class "Firefox"))

;; shell command
(defcommand window-info () ()
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

;; safe kill
(defcommand safe-kill () ()
  "safe delete current window"
  (let ((choice (yes-no-diag
                 (format nil "Close window: ~a?"
                         (window-name (current-window))))))
    (when choice
      (kill))))

;; safe gkill
(defcommand safe-gkill () ()
  "safe delete current group"
  (let ((choice (yes-no-diag
                 (format nil "Close group: ~a?"
                         (group-name (current-group))))))
    (when choice
      (gkill))))

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
  "select resolution for stumpwm"
  (let ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("1920x1080" "--mode 1920x1080")
                         ("1600x900"  "--mode 1600x900")
                         ("1280x720"  "--mode 1280x720"))
                       "Select resolution")))
        (output "xrandr | grep primary | awk '{print $1}'"))
    (run-shell-command (format nil "xrandr --output `~a` ~a" output choice))))

;; key layout select
(defcommand key-layout () ()
  "select key layout for stumpwm"
  (let* ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("default" "default.xmodmap")
                         ("hyper"   "hyper.xmodmap"))
                       "Select key layout")))
         (config (merge-pathnames
                  (concat "misc/.xmodmap/" choice) *zz-load-directory*)))
    (run-shell-command "setcapslock off")
    (run-shell-command (format nil "xmodmap ~a" config))))
