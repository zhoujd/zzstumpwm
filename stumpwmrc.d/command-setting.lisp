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
(define-sudo-command bright-setup (concat *zz-load-directory* "libexec/brightness-setup.sh"))

;; run-or-raise
;; firefox quit: ctrl+q
(def-run-or-raise-command firefox '(:class "Firefox"))
;; chrome quit: left:ctrl+shift+w or alt+f4
(def-run-or-raise-command google-chrome '(:class "Google-chrome"))
;; pidgin
(def-run-or-raise-command pidgin  '(:class "Pidgin"))
;; thunderbird
(def-run-or-raise-command thunderbird '(:class "Thunderbird"))
;; evolution
(def-run-or-raise-command evolution '(:class "Evolution"))
;; thunar
(def-run-or-raise-command thunar '(:class "Thunar"))
;; teams
(def-run-or-raise-command teams '(:class "Microsoft Teams - Preview"))
;; intel-unite-client
(def-run-or-raise-command intel-unite-client '(:title "Intel Unite® App"))
;; deadbeef
(def-run-or-raise-command deadbeef '(:title "Deadbeef"))
;; cherrytree
(def-run-or-raise-command cherrytree '(:title "Cherrytree"))
;; claws-mail
(def-run-or-raise-command claws-mail '(:title "Claws-mail"))
;; libreoffice
(def-run-or-raise-command libreoffice '(:title "libreoffice"))
;; slingscold
(def-run-or-raise-command slingscold '(:title "Slingscold"))

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

;; ubuntu: sudo apt install acpi
;; arch: sudo pacman -S acpi
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

;; surf browser
;; arch: sudo pacman -S surf tabbed
;; C-g -> enter new URL
;; C-q -> quit
;; C-[0..9] -> jump nth tab
;; C-t -> select or create a tab
;; Ctrl+Shift+Enter -> open new tab
(defcommand surf () ()
  "run surf"
  (let ((homepage "www.google.com")
        (f "tabbed -c -r 2 surf -pe x ~a 2>/dev/null"))
    (run-shell-command (format nil f homepage))))

;; skippy windows
(defcommand skippy () ()
  "run skippy-xd"
  (run-shell-command "skippy-xd"))

;; print current group name
(defcommand gprint () ()
  "print current group name"
  (message "Current Group: ~A" (group-name (current-group))))

;; urxvt in current group
(defcommand urxvt () ()
  "run urxvt"
  (run-or-raise "urxvt" '(:class "URxvt") nil nil))

;; sakura in current group
(defcommand sakura () ()
  "run sakura"
  (run-or-raise "sakura" '(:class "Sakura") nil nil))

;; safe kill
(defcommand safe-kill () ()
  "safe delete current window"
  (let ((choice (yes-no-diag
                 (format nil "Close window: ~a?"
                         (window-name (current-window))))))
    (when choice
      (kill-window))))

;; safe gkill
(defcommand safe-gkill () ()
  "safe delete current group"
  (let ((choice (yes-no-diag
                 (format nil "Close group: ~a?"
                         (group-name (current-group))))))
    (when choice
      (dolist (window (stumpwm::group-windows (current-group)))
        (stumpwm::delete-window window))
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
      (delete-all))))

;; safe end
(defcommand safe-end () ()
  "safe end session"
  (echo-string (current-screen) "Ending Session...")
  (delete-all)
  (run-hook *quit-hook*))
  
;; safe quit
(defcommand safe-quit () ()
  "safe quit"
  (let ((choice (yes-no-diag "Close all programs and quit stumpwm?")))
    (when choice
      (safe-end)
      (quit))))

;; kill stumpwm
(defcommand kill-stumpwm () ()
  "kill stumpwm"
  (let ((choice (yes-no-diag "Close all programs and kill stumpwm?")))
    (when choice
      (safe-end)
      (kill-ps "stumpwm"))))

;; resolution select
(defcommand resolution () ()
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
(defcommand key-layout () ()
  "select key layout for stumpwm"
  (let* ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("default" "default.xmodmap")
                         ("hyper"   "hyper.xmodmap")
                         ("laptop"  "laptop.xmodmap"))
                       "Select keyboard layout")))
         (config (merge-pathnames
                  (concat "misc/.xmodmap/" choice) *zz-load-directory*)))
    (run-shell-command "setcapslock off")
    (run-shell-command (format nil "xmodmap ~a" config))))

;; run stumpish
(defcommand stumpish () ()
  "run stumpish"
  (run-shell-command (format nil "urxvt -e ~a"
                             (merge-pathnames "bin/stumpish" *zz-load-directory*))))

;; run info manual
(defcommand stumpwm-manual () ()
  "run stumpwm info manual"
  (run-shell-command (format nil "urxvt -e info ~a"
                             (merge-pathnames "doc/stumpwm.info" *zz-load-directory*))))

;; brightness up
(defcommand bright-up () ()
  "brightness up"
  (run-shell-command (format nil "~a +5"
                             (merge-pathnames "libexec/brightness.sh" *zz-load-directory*))))
;; brightness down
(defcommand bright-down () ()
  "brightness down"
  (run-shell-command (format nil "~a -5"
                             (merge-pathnames "libexec/brightness.sh" *zz-load-directory*))))

;; pactl up
(defcommand pactl-up () ()
  "pactl sound up"
  (run-shell-command
   (format nil "~a +10%"
           "pacmd list-sinks | \
            grep -oP 'index: \\d+' | \
            awk '{ print $2 }' | \
            xargs -I{} pactl set-sink-volume {}")))

;; pactl down
(defcommand pactl-down () ()
  "pactl sound down"
  (run-shell-command
   (format nil "~a -10%"
           "pacmd list-sinks | \
            grep -oP 'index: \\d+' | \
            awk '{ print $2 }' | \
            xargs -I{} pactl set-sink-volume {}")))

;; pactl toggle
(defcommand pactl-toggle () ()
  "pactl sound toggle"
  (run-shell-command
   (format nil "~a"
           "pacmd list-sinks | \
            grep -oP 'index: \\d+' | \
            awk '{ print $2 }' | \
            xargs -I{} pactl set-sink-mute {} toggle")))

;; pactl mic toggle
(defcommand pactl-mic-toggle () ()
  "pactl micphone toggle"
  (run-shell-command
   (format nil "~a"
           "pacmd list-sources | \
            grep -oP 'index: \\d+' | \
            awk '{ print $2 }' | \
            xargs -I{} pactl set-source-mute {} toggle")))

;; system action
(defcommand system-action () ()
  "system actions"
  (let ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("logout"    "kill-stumpwm")
                         ("reboot"    "reboot")
                         ("shutdown"  "shutdown"))
                       "Select system action"))))
    (when choice
      (eval-command (format nil "~a" choice)))))

;; micphone mute toggle
(defcommand amixer-mic-toggle () ()
  "micphone toggle"
  (run-shell-command "amixer set Capture toggle"))

;; screenshot full
(defcommand scrot-full () ()
  "screenshot full"
  (run-shell-command "scrot ~/Pictures/screenshots/%b%d::%H%M%S.png"))

;; screenshot window
(defcommand scrot-window () ()
  "screenshot windows"
  (run-shell-command "scrot -u ~/Pictures/screenshots/%b%d::%H%M%S.png"))

;; screenshot window
(defcommand scrot-select () ()
  "screenshot select"
  (run-shell-command "scrot -s ~/Pictures/screenshots/%b%d::%H%M%S.png"))

;; capslock toggle
(defcommand capslock-toggle () ()
  "capslock toggle"
  (run-shell-command "setcapslock toggle"))

;; showing and toggling the root window
(defvar *last-saved-window* nil
  "Last saved window configuration.")

;; show root window
(defcommand show-root () ()
  "Show root window."
  (when (cdr (group-frames (current-group)))
    ;; Make one frame if necessary.
    (only))
  (fclear))

;; toggle root window
(defcommand toggle-root () ()
  "Toggle between root window and last window configuration."
  (if (current-window)
      (progn
        (setf *last-saved-window* (dump-group (current-group)))
        (show-root))
      ;; Current window is root.
      (if *last-saved-window*
          (restore-group (current-group) *last-saved-window*)
          (echo "There is no saved window configuration yet."))))
