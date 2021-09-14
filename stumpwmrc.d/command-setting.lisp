;;;; command setting -*-lisp-*-
;;

(in-package :zwm)

;; webjumps q=query+goes+here
(make-web-jump "google"    "firefox https://www.google.com/search?q=")
(make-web-jump "bing"      "firefox https://www.bing.com/search?q=")
(make-web-jump "wikipedia" "firefox https://en.wikipedia.org/w/index.php?search=")

;; sudo command
(define-sudo-command reboot "reboot")
(define-sudo-command shutdown "shutdown -h now")
(define-sudo-command bright-setup (concat *zz-load-directory* "libexec/brightness-setup.sh"))

;; run-or-raise
(def-run-or-raise-command albert        '(:title "albert"))
(def-run-or-raise-command audacity      '(:class "Audacity"))
(def-run-or-raise-command cherrytree    '(:title "Cherrytree"))
(def-run-or-raise-command claws-mail    '(:title "Claws-mail"))
(def-run-or-raise-command deadbeef      '(:title "Deadbeef"))
(def-run-or-raise-command drawio        '(:class "draw.io"))
(def-run-or-raise-command evolution     '(:class "Evolution"))
(def-run-or-raise-command firefox       '(:class "Firefox"))
(def-run-or-raise-command google-chrome '(:class "Google-chrome"))
(def-run-or-raise-command gvim          '(:class "Gvim"))
(def-run-or-raise-command intel-unite   '(:title "Intel Unite® App"))
(def-run-or-raise-command klavaro       '(:class "Klavaro"))
(def-run-or-raise-command libreoffice   '(:title "libreoffice"))
(def-run-or-raise-command mobl-raise    '(:title "jiandon-mobl"))
(def-run-or-raise-command mpv           '(:class "mpv"))
(def-run-or-raise-command nyxt          '(:class "Nyxt"))
(def-run-or-raise-command qutebrowser   '(:class "qutebrowser"))
(def-run-or-raise-command pidgin        '(:class "Pidgin"))
(def-run-or-raise-command slingscold    '(:title "Slingscold"))
(def-run-or-raise-command thunderbird   '(:class "Thunderbird"))
(def-run-or-raise-command thunar        '(:class "Thunar"))
(def-run-or-raise-command tmux          '(:title "tmux"))
(def-run-or-raise-command teams         '(:class "Microsoft Teams - Preview"))
(def-run-or-raise-command vlc           '(:class "Vlc"))
(def-run-or-raise-command wireshark     '(:class "Wireshark"))
(def-run-or-raise-command pavucontrol   '(:class "Pavucontrol"))

;; shell command
(defcommand window-info () ()
  "Shows the properties of the current window. These properties can be
used for matching windows with run-or-raise or window placement-merules."
  (let ((w (current-window))
        (nl (string #\NewLine))
        (*suppress-echo-timeout* t))
    (echo-string (current-screen)
                 (concat "class:    " (stumpwm::window-class w) nl
                         "instance: " (stumpwm::window-res w) nl
                         "type:     " (string (stumpwm::window-type w)) nl
                         "role:     " (stumpwm::window-role w) nl
                         "title:    " (stumpwm::window-title w) nl
                         "width:    " (format nil "~a" (stumpwm::window-width w)) nl
                         "height    " (format nil "~a" (stumpwm::window-height w))))))

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

;; emacsclient
(defcommand emacsclient () ()
  "emacsclient"
  (if (emacs-ds-exists)
      (run-shell-command "emacsclient -c -a emacs")
      (echo-string (current-screen) "No emacs daemon exist!")))

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

;; mobl-run
(defcommand mobl-run () ()
  "run remote jiandon-mobl"
  (run-shell-command "remmina -c ~/.jiandon-mobl.remmina"))

;; print current group name
(defcommand gprint () ()
  "print current group name"
  (message "Current Group: ~A" (stumpwm::group-name (current-group))))

;; urxvt in current group
(defcommand urxvt () ()
  "run urxvt"
  (run-or-raise "urxvt" '(:class "URxvt") nil nil))

;; safe kill
(defcommand safe-kill () ()
  "safe delete current window"
  (if (current-window)
      (let ((choice (yes-no-diag
                     (format nil "Close window: ~a?"
                             (stumpwm::window-name (current-window))))))
        (when choice
          (stumpwm::kill-window)))
      (message "Cannot close desktop!")))

;; safe gkill
(defcommand safe-gkill () ()
  "safe delete current group"
  (let ((choice (yes-no-diag
                 (format nil "Close group: ~a?"
                         (stumpwm::group-name (current-group))))))
    (when choice
      (dolist (window (stumpwm::group-windows (current-group)))
        (stumpwm::delete-window window))
      (stumpwm::gkill))))

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
      (stumpwm::quit))))

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
                       '(("0-1920x1080" "--mode 1920x1080")
                         ("1-1600x900"  "--mode 1600x900")
                         ("2-1280x720"  "--mode 1280x720"))
                       "Select display resolution")))
        (output "xrandr | grep primary | awk '{print $1}'"))
    (run-shell-command (format nil "xrandr --output `~a` ~a" output choice))))

;; keymap menu
(defcommand keymap-menu () ()
  "keymap menu"
  (let* ((choice (cadr (select-from-menu
                        (current-screen)
                        '(("0-default" "default.xmodmap")
                          ("1-hyper"   "hyper.xmodmap")
                          ("2-laptop"  "laptop.xmodmap"))
                        "Select keyboard layout")))
         (config (merge-pathnames
                  (concat "misc/.xmodmap/" choice) *zz-load-directory*)))
    (run-shell-command "setcapslock off")
    (run-shell-command (format nil "xmodmap ~a" config))))

;; wifi menu
(defcommand wifi-menu () ()
  "wifi menu"
  (run-shell-command (format nil "~a"
                             (merge-pathnames "libexec/rofi-wifi" *zz-load-directory*))))

;; tmux menu
(defcommand tmux-menu () ()
  "tmux menu"
  (run-shell-command (format nil "~a"
                             (merge-pathnames "libexec/tmux-session" *zz-load-directory*))))

;; screen menu
(defcommand screen-menu () ()
  "screen menu"
  (run-shell-command (format nil "~a"
                             (merge-pathnames "libexec/rofi-screen" *zz-load-directory*))))

;; locate menu
(defcommand locate-menu () ()
  "locate menu"
  (run-shell-command (format nil "~a"
                             (merge-pathnames "libexec/rofi-locate" *zz-load-directory*))))

;; search menu
(defcommand search-menu () ()
  "search menu"
  (run-shell-command (format nil "~a"
                             (merge-pathnames "libexec/rofi-search" *zz-load-directory*))))

;; run stumpish
;; Ubuntu: sudo apt install rlwrap
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
                             (merge-pathnames "libexec/brightness" *zz-load-directory*))))
;; brightness down
(defcommand bright-down () ()
  "brightness down"
  (run-shell-command (format nil "~a -5"
                             (merge-pathnames "libexec/brightness" *zz-load-directory*))))

;; pactl up
(defcommand pactl-up () ()
  "pactl sound up"
  (pactl-volume "+10%"))

;; pactl down
(defcommand pactl-down () ()
  "pactl sound down"
  (pactl-volume "-10%"))

;; pactl 100%
(defcommand pactl-inc () ()
  "pactl sound 100%"
  (pactl-volume "100%"))

;; pactl 50%
(defcommand pactl-dec () ()
  "pactl sound 50%"
  (pactl-volume "50%"))

;; pactl toggle
(defcommand pactl-toggle () ()
  "pactl sound toggle"
  (run-shell-command "pactl set-sink-mute @DEFAULT_SINK@ toggle"))

;; pactl mic toggle
(defcommand pactl-mic-toggle () ()
  "pactl micphone toggle"
  (run-shell-command "pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

;; system action
(defcommand system-action () ()
  "system actions"
  (let ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("0-logout"    "kill-stumpwm")
                         ("1-reboot"    "reboot")
                         ("2-shutdown"  "shutdown"))
                       "Select system action"))))
    (when choice
      (stumpwm::eval-command (format nil "~a" choice)))))

;; micphone mute toggle
(defcommand amixer-mic-toggle () ()
  "micphone toggle"
  (run-shell-command "amixer set Capture toggle"))

(defvar *zz-shot-folder* "~/Pictures/screenshots/"
  "folder for store screenshots")

;; screenshot full
(defcommand scrot-full () ()
  "screenshot full"
  (ensure-directories-exist *zz-shot-folder*)
  (run-shell-command (format nil "scrot ~a/%b%d::%H%M%S.png"
                             *zz-shot-folder*) t)
  (message "screenshot full under: ~a" *zz-shot-folder*))

;; screenshot window
(defcommand scrot-window () ()
  "screenshot windows"
  (ensure-directories-exist *zz-shot-folder*)
  (run-shell-command (format nil "scrot -u ~a/%b%d::%H%M%S.png"
                             *zz-shot-folder*) t)
  (message "screenshot window under: ~a" *zz-shot-folder*))

;; screenshot select
(defcommand scrot-select () ()
  "screenshot select"
  (ensure-directories-exist *zz-shot-folder*)
  (run-shell-command (format nil "scrot -s ~a/%b%d::%H%M%S.png"
                             *zz-shot-folder*) t)
  (message "screenshot select under: ~a" *zz-shot-folder*))

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
  (when (cdr (stumpwm::group-frames (current-group)))
    ;; Make one frame if necessary.
    (stumpwm::only))
  (stumpwm::fclear))

;; toggle root window
(defcommand toggle-root () ()
  "Toggle between root window and last window configuration."
  (if (current-window)
      (progn
        (setf *last-saved-window* (stumpwm::dump-group (current-group)))
        (show-root))
      ;; Current window is root.
      (if *last-saved-window*
          (stumpwm::restore-group (current-group) *last-saved-window*)
          (stumpwm::echo "There is no saved window configuration yet."))))

;; swap windows
(defun shift-windows-forward (frames win)
  (when frames
    (let ((frame (car frames)))
      (shift-windows-forward (cdr frames)
                             (stumpwm::frame-window frame))
      (when win
        (stumpwm::pull-window win frame)))))

(defcommand swap-windows () ()
  "swap 2 windows"
  (let* ((frames (stumpwm::group-frames (current-group)))
         (win (stumpwm::frame-window (car (last frames)))))
    (shift-windows-forward frames win)))

;; save & restore group
(defvar *zz-group-file* "~/.stumpwm-group"
  "group layout file name")
(defcommand dump-group-file () ()
  "dump group"
  (dump-group-to-file *zz-group-file*))

(defcommand restore-group-file () ()
  "restore group"
  (if (probe-file *zz-group-file*)
      (stumpwm::restore-from-file *zz-group-file*)
      (message "This no is ~a." *zz-group-file*)))

;; process menu
(defcommand process-menu () ()
  "process menu"
  (run-shell-command (urxvt-command "htop")))

;; eval shell
(defcommand eval-shell (&optional (initial "")) (:rest)
  "shell interactive command, done to keep"
  (let ((cmd (read-one-line (current-screen) "shell: " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec urxvt -e bash -c '~a; bash -l'"
                            cmd)
                    t))))

;; eval command
(defcommand eval-command (&optional (initial "")) (:rest)
  "shell interactive command, done to exit"
  (let ((cmd (read-one-line (current-screen) "cmd: " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec urxvt -e bash -c '~a; read'"
                            cmd)
                    t))))

;; trans command
(defcommand trans-command (&optional (initial "")) (:rest)
  "shell interactive command, done to exit"
  (let ((cmd (read-one-line (current-screen) "trans: " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec urxvt -title 'trans' -e bash -c 'trans -no-warn ~a; read'"
                            cmd)
                    t))))

;; trans shell
(defcommand trans-shell () ()
  "run skippy-xd"
  (run-shell-command "exec urxvt -title 'trans' -e bash -c 'trans -I'"))

;; ssh shell
(defcommand ssh-shell (&optional (initial "")) (:rest)
  "ssh shell"
  (let ((cmd (read-one-line (current-screen) "ssh: " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec urxvt -e ssh ~a"
                            cmd)
                    t))))

;; kill from windowlist
(defcommand kill-from-windowlist (&optional (fmt *window-format*)) (:rest)
  "kill from windowlist"
  (let ((window-to-kill (stumpwm::select-window-from-menu
                         (stumpwm::group-windows (current-group))
                         fmt)))
    (when window-to-kill
      (stumpwm::kill-window window-to-kill))))

;; manpage reader. needs filename completion, etc..
(defcommand manpage (command) ((:rest "manpage: "))
  "manpage reader"
  (run-shell-command (format nil "urxvt -e man ~a" command)))
