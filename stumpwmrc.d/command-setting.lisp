;;;; command setting -*-lisp-*-
;;

(in-package :stumpwm)

;; prompt the user for an interactive command.
(defcommand zz/colon1 (&optional (initial "")) (:rest)
  "interactive command"
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))

;; webjumps q=query+goes+here
(zz/make-web-jump "zz/google" "firefox https://www.google.com/search?q=")
(zz/make-web-jump "zz/bing" "firefox https://www.bing.com/search?q=")
(zz/make-web-jump "zz/wikipedia" "firefox https://en.wikipedia.org/w/index.php?search=")

;; sudo command
(zz/define-sudo-command zz/reboot "reboot")
(zz/define-sudo-command zz/shutdown "shutdown -h now")
(zz/define-sudo-command zz/bright-setup (concat *zz/load-directory* "libexec/brightness-setup.sh"))

;; run-or-raise
;; firefox quit: ctrl+q
(zz/def-run-or-raise-command zz/firefox '(:class "Firefox"))
;; chrome quit: left:ctrl+shift+w or alt+f4
(zz/def-run-or-raise-command zz/google-chrome '(:class "Google-chrome"))
;; pidgin
(zz/def-run-or-raise-command zz/pidgin  '(:class "Pidgin"))
;; thunderbird
(zz/def-run-or-raise-command zz/thunderbird '(:class "Thunderbird"))
;; evolution
(zz/def-run-or-raise-command zz/evolution '(:class "Evolution"))
;; thunar
(zz/def-run-or-raise-command zz/thunar '(:class "Thunar"))
;; teams
(zz/def-run-or-raise-command zz/teams '(:class "teams-for-linux"))
;; intel-unite-client
(zz/def-run-or-raise-command zz/intel-unite-client '(:title "Intel Unite® App"))
;; deadbeef
(zz/def-run-or-raise-command zz/deadbeef '(:title "Deadbeef"))

;; shell command
(defcommand zz/window-info () ()
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

(defcommand zz/reinit () ()
  "reload stumpwm configure"
  (run-commands "reload" "loadrc"))

;; ubuntu: sudo apt install acpi
;; arch: sudo pacman -S acpi
(defcommand zz/show-battery () ()
  "show battery usage"
  (echo-string (current-screen) (run-shell-command "acpi" t)))

(defcommand zz/uptime () ()
  "show uptime"
  (echo-string (current-screen) (run-shell-command "uptime" t)))

;; emacs in current group
(defcommand zz/runemacs () ()
  "run emacs"
  (run-or-raise "emacs" '(:class "Emacs") nil nil))

;; surf browser
;; arch: sudo pacman -S surf tabbed
;; C-g -> enter new URL
;; C-q -> quit
;; C-[0..9] -> jump nth tab
;; C-t -> select or create a tab
;; Ctrl+Shift+Enter -> open new tab
(defcommand zz/surf () ()
  "run surf"
  (let ((homepage "www.google.com")
        (f "tabbed -c -r 2 surf -pe x ~a 2>/dev/null"))
    (run-shell-command (format nil f homepage))))

;; skippy windows
(defcommand zz/skippy () ()
  "run skippy-xd"
  (run-shell-command "skippy-xd"))

;; print current group name
(defcommand zz/gprint () ()
  "print current group name"
  (message "Current Group: ~A" (group-name (current-group))))

;; urxvt in current group
(defcommand zz/urxvt () ()
  "run urxvt"
  (run-or-raise "urxvt" '(:class "URxvt") nil nil))

;; sakura in current group
(defcommand zz/sakura () ()
  "run sakura"
  (run-or-raise "sakura" '(:class "Sakura") nil nil))

;; safe kill
(defcommand zz/safe-kill () ()
  "safe delete current window"
  (let ((choice (zz/yes-no-diag
                 (format nil "Close window: ~a?"
                         (window-name (current-window))))))
    (when choice
      (kill-window))))

;; safe gkill
(defcommand zz/safe-gkill () ()
  "safe delete current group"
  (let ((choice (zz/yes-no-diag
                 (format nil "Close group: ~a?"
                         (group-name (current-group))))))
    (when choice
      (dolist (window (stumpwm::group-windows (current-group)))
        (stumpwm::delete-window window))
      (gkill))))

;; close all windows
(defcommand zz/delete-all () ()
  "close all windows"
  (dolist (screen *screen-list*)
    (dolist (group (stumpwm::screen-groups screen))
      (dolist (window (stumpwm::group-windows group))
        (stumpwm::delete-window window)))))

;; safe delete
(defcommand zz/safe-delete () ()
  "safe delete all windows"
  (let ((choice (zz/yes-no-diag "Close all programs?")))
    (when choice
      (zz/delete-all))))

;; safe end
(defcommand zz/safe-end () ()
  "safe end session"
  (echo-string (current-screen) "Ending Session...")
  (zz/delete-all)
  (run-hook *quit-hook*))
  
;; safe quit
(defcommand zz/safe-quit () ()
  "safe quit"
  (let ((choice (zz/yes-no-diag "Close all programs and quit stumpwm?")))
    (when choice
      (zz/safe-end)
      (quit))))

;; kill stumpwm
(defcommand zz/kill-stumpwm () ()
  "kill stumpwm"
  (let ((choice (zz/yes-no-diag "Close all programs and kill stumpwm?")))
    (when choice
      (zz/safe-end)
      (zz/kill-ps "stumpwm"))))

;; resolution select
(defcommand zz/resolution () ()
  "select resolution for stumpwm"
  (let ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("1920x1080" "--mode 1920x1080")
                         ("1600x900"  "--mode 1600x900")
                         ("1280x720"  "--mode 1280x720"))
                       "Select display resolution")))
        (output "xrandr | grep primary | awk '{print $1}'"))
    (run-shell-command (format nil "xrandr --output `~a` ~a" output choice))))

;; key layout select
(defcommand zz/key-layout () ()
  "select key layout for stumpwm"
  (let* ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("default" "default.xmodmap")
                         ("hyper"   "hyper.xmodmap")
                         ("laptop"  "laptop.xmodmap"))
                       "Select keyboard layout")))
         (config (merge-pathnames
                  (concat "misc/.xmodmap/" choice) *zz/load-directory*)))
    (run-shell-command "setcapslock off")
    (run-shell-command (format nil "xmodmap ~a" config))))

;; run stumpish
(defcommand zz/stumpish () ()
  "run stumpish"
  (run-shell-command (format nil "urxvt -e ~a"
                             (merge-pathnames "bin/stumpish" *zz/load-directory*))))

;; run info manual
(defcommand zz/stumpwm-manual () ()
  "run stumpwm info manual"
  (run-shell-command (format nil "urxvt -e info ~a"
                             (merge-pathnames "doc/stumpwm.info" *zz/load-directory*))))

;; brightness up
(defcommand zz/bright-up () ()
  "brightness up"
  (run-shell-command (format nil "~a +5"
                             (merge-pathnames "libexec/brightness.sh" *zz/load-directory*))))
;; brightness down
(defcommand zz/bright-down () ()
  "brightness down"
  (run-shell-command (format nil "~a -5"
                             (merge-pathnames "libexec/brightness.sh" *zz/load-directory*))))

;; system action
(defcommand zz/system-action () ()
  "system actions"
  (let ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("logout"    "zz/kill-stumpwm")
                         ("reboot"    "zz/reboot")
                         ("shutdown"  "zz/shutdown"))
                       "Select system action"))))
    (when choice
      (eval-command (format nil "~a" choice)))))

;; micphone mute toggle
(defcommand zz/amixer-mic-toggle () ()
  "micphone toggle"
  (run-shell-command "amixer set Capture toggle"))

;; screenshot full
(defcommand zz/scrot-full () ()
  "screenshot full"
  (run-shell-command "scrot ~/Pictures/screenshots/%b%d::%H%M%S.png"))

;; screenshot window
(defcommand zz/scrot-window () ()
  "screenshot windows"
  (run-shell-command "scrot -u ~/Pictures/screenshots/%b%d::%H%M%S.png"))

;; screenshot window
(defcommand zz/scrot-select () ()
  "screenshot select"
  (run-shell-command "scrot -s ~/Pictures/screenshots/%b%d::%H%M%S.png"))

;; capslock toggle
(defcommand zz/capslock-toggle () ()
  "capslock toggle"
  (run-shell-command "setcapslock toggle"))

;; Showing and toggling the root window
(defvar *zz/window-configuration* nil
  "Last saved window configuration.")

(defcommand zz/show-root () ()
  "Show root window."
  (when (cdr (group-frames (current-group)))
    ;; Make one frame if necessary.
    (only))
  (fclear))

(defcommand zz/toggle-root () ()
  "Toggle between root window and last window configuration."
  (if (current-window)
      (progn
        (setf *zz/window-configuration* (dump-group (current-group)))
        (zz/show-root))
      ;; Current window is root.
      (if *zz/window-configuration*
          (restore-group (current-group) *zz/window-configuration*)
          (echo "There is no saved window configuration yet."))))
