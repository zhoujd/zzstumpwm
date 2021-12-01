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
(def-run-or-raise-command audacity      '(:class "Audacity"))
(def-run-or-raise-command cheese        '(:class "Cheese"))
(def-run-or-raise-command cherrytree    '(:Class "Cherrytree"))
(def-run-or-raise-command claws-mail    '(:Class "Claws-mail"))
(def-run-or-raise-command deadbeef      '(:Class "Deadbeef"))
(def-run-or-raise-command drawio        '(:class "draw.io"))
(def-run-or-raise-command evolution     '(:class "Evolution"))
(def-run-or-raise-command firefox       '(:class "Firefox"))
(def-run-or-raise-command google-chrome '(:class "Google-chrome"))
(def-run-or-raise-command gvim          '(:class "Gvim"))
(def-run-or-raise-command intel-unite   '(:title "Intel Unite® App"))
(def-run-or-raise-command klavaro       '(:class "Klavaro"))
(def-run-or-raise-command libreoffice   '(:title "libreoffice"))
(def-run-or-raise-command mpv           '(:class "mpv"))
(def-run-or-raise-command nyxt          '(:class "Nyxt"))
(def-run-or-raise-command qutebrowser   '(:class "qutebrowser"))
(def-run-or-raise-command pidgin        '(:class "Pidgin"))
(def-run-or-raise-command slingscold    '(:Class "Slingscold"))
(def-run-or-raise-command thunderbird   '(:class "Thunderbird"))
(def-run-or-raise-command thunar        '(:class "Thunar"))
(def-run-or-raise-command teams         '(:class "Microsoft Teams - Preview"))
(def-run-or-raise-command urxvt         '(:class "URxvt"))
(def-run-or-raise-command vlc           '(:class "Vlc"))
(def-run-or-raise-command wireshark     '(:class "Wireshark"))
(def-run-or-raise-command pavucontrol   '(:class "Pavucontrol"))

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

(defcommand skippy () ()
  "run skippy-xd"
  (run-shell-command "skippy-xd"))

(defcommand jiandon-mobl () ()
  "run remote jiandon-mobl"
  (run-or-raise "remmina -c ~/.jiandon-mobl.remmina" '(:title "jiandon-mobl")))

(defcommand gprint () ()
  "print current group name"
  (message "Current Group: ~A" (stumpwm::group-name (current-group))))

(defcommand runurxvt () ()
  "run urxvt"
  (run-or-raise-prefer-group "urxvt" "URxvt"))

(defcommand pullurxvt () ()
  "pull urxvt"
  (run-or-pull-prefer-group "urxvt" "URxvt"))

(defcommand urxvtclient () ()
  "run urxvt client"
  (run-shell-command "urxvtc"))

(defcommand runemacs () ()
  "run emacs"
  (run-or-raise-prefer-group "emacs" "Emacs"))

(defcommand pullemacs () ()
  "pull emacs"
  (run-or-pull-prefer-group "emacs" "Emacs"))

(defcommand emacsclient () ()
  "emacsclient"
  (if (emacs-ds-exists)
      (run-shell-command "emacsclient -c -a emacs")
      (echo-string (current-screen) "No emacs daemon exist!")))

(defcommand rungc () ()
  "run google-chrome"
  (run-or-raise-prefer-group "google-chrome" "Google-chrome"))

(defcommand pullgc () ()
  "pull google-chromje"
  (run-or-pull-prefer-group "google-chrome" "Google-chrome"))

(defcommand safe-kill () ()
  "safe delete current window"
  (if (current-window)
      (let ((choice (yes-no-diag
                     (format nil "Close window: ~a?"
                             (stumpwm::window-name (current-window))))))
        (when choice
          (stumpwm::kill-window)))
      (message "Cannot close desktop!")))

(defcommand group-kill () ()
  "safe delete current group"
  (let* ((group (current-group))
         (screen (group-screen group))
         (choice (yes-no-diag
                  (format nil "Close group: ~a?"
                          (stumpwm::group-name group)))))
    (when choice
      (dolist (window (stumpwm::group-windows group))
        (stumpwm::delete-window window))
      (setf (screen-groups screen)
            (remove group (screen-groups screen))))))

(defcommand delete-group-windows () ()
  "close all group windows"
  (dolist (window (stumpwm::group-windows (current-group)))
    (stumpwm::delete-window window)))

(defcommand delete-all-windows () ()
  "close all windows"
  (dolist (screen *screen-list*)
    (dolist (group (stumpwm::screen-groups screen))
      (dolist (window (stumpwm::group-windows group))
        (stumpwm::delete-window window)))))

(defcommand safe-delete-windows () ()
  "safe delete all windows in current group"
    (let ((choice (yes-no-diag
                 (format nil "Close all programs in group: ~a?"
                         (stumpwm::group-name (current-group))))))
    (when choice
      (delete-group-windows))))

(defcommand safe-delete () ()
  "safe delete all windows"
  (let ((choice (yes-no-diag "Close all programs?")))
    (when choice
      (delete-all-windows))))

(defcommand safe-end () ()
  "safe end session"
  (delete-all-windows)
  (run-hook *quit-hook*))

(defcommand safe-quit () ()
  "safe quit"
  (let ((choice (yes-no-diag "Close all programs and quit stumpwm?")))
    (when choice
      (safe-end)
      (stumpwm::quit))))

(defcommand kill-stumpwm () ()
  "kill stumpwm"
  (let ((choice (yes-no-diag "Close all programs and kill stumpwm?")))
    (when choice
      (safe-end)
      (kill-ps "stumpwm"))))

;; Ubuntu: sudo apt install rlwrap
(defcommand stumpish () ()
  "run stumpish"
  (run-shell-command
   (format nil "urxvt -e ~a"
           (merge-pathnames "bin/stumpish" *zz-load-directory*))))

(defcommand stumpwm-manual () ()
  "run stumpwm info manual"
  (run-shell-command
   (format nil "urxvt -e info ~a"
           (merge-pathnames "doc/stumpwm.info" *zz-load-directory*))))

(defcommand bright-up () ()
  "brightness up"
  (run-shell-command
   (format nil "~a +5"
           (merge-pathnames "libexec/brightness" *zz-load-directory*))))

(defcommand bright-down () ()
  "brightness down"
  (run-shell-command
   (format nil "~a -5"
           (merge-pathnames "libexec/brightness" *zz-load-directory*))))

(defcommand pactl-up () ()
  "pactl sound up"
  (pactl-volume "+10%")
  (stumpwm::eval-command "pactl-status"))

(defcommand pactl-down () ()
  "pactl sound down"
  (pactl-volume "-10%")
  (stumpwm::eval-command "pactl-status"))

(defcommand pactl-inc () ()
  "pactl sound 100%"
  (pactl-volume "100%"))

(defcommand pactl-dec () ()
  "pactl sound 50%"
  (pactl-volume "50%"))

(defcommand pactl-status () ()
  "pactl status"
  (let ((cmd (format nil "~a vol status"
                     (merge-pathnames "bin/sndctl" *zz-load-directory*))))
    (message "~a" (run-shell-command cmd t))))

(defcommand pactl-toggle () ()
  "pactl sound toggle"
  (run-shell-command "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  (stumpwm::eval-command "pactl-status"))

(defcommand pactl-mic-up () ()
  "pactl mic sound up"
  (pactl-mic-volume "+10%")
  (stumpwm::eval-command "pactl-mic-status"))

(defcommand pactl-mic-down () ()
  "pactl mic sound down"
  (pactl-mic-volume "-10%")
  (stumpwm::eval-command "pactl-mic-status"))

(defcommand pactl-mic-status () ()
  "pactl mic status"
  (let ((cmd (format nil "~a mic status"
                     (merge-pathnames "bin/sndctl" *zz-load-directory*))))
    (message "~a" (run-shell-command cmd t))))

(defcommand pactl-mic-toggle () ()
  "pactl micphone toggle"
  (run-shell-command "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
  (stumpwm::eval-command "pactl-mic-status"))

(progn
  (defvar *zz-shot-folder* "~/Pictures/screenshots"
    "folder for store screenshots")
  (defcommand scrot-full () ()
    "screenshot full"
    (ensure-directories-exist *zz-shot-folder*)
    (run-shell-command (format nil "scrot ~a/%b%d::%H%M%S.png"
                               *zz-shot-folder*) t)
    (message "screenshot full under: ~a" *zz-shot-folder*))
  (defcommand scrot-window () ()
    "screenshot windows"
    (ensure-directories-exist *zz-shot-folder*)
    (run-shell-command (format nil "scrot -u ~a/%b%d::%H%M%S.png"
                               *zz-shot-folder*) t)
    (message "screenshot window under: ~a" *zz-shot-folder*))
  (defcommand scrot-select () ()
    "screenshot select"
    (ensure-directories-exist *zz-shot-folder*)
    (let* ((file-name (string-trim '(#\Newline)
                                   (run-shell-command "date +%b%d::%H%M%S.png" t)))
           (file-path (format nil "~a/~a" *zz-shot-folder* file-name)))
      (run-shell-command (format nil "scrot -s ~a" file-path) t)
      (when (probe-file file-path)
        (message "screenshot select: ~a" file-path)))))

(defcommand capslock-toggle () ()
  "capslock toggle"
  (run-shell-command "setcapslock toggle"))

;; showing and toggling the root window
(progn
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
            (stumpwm::echo "There is no saved window configuration yet.")))))

;; swap windows
(progn
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
      (shift-windows-forward frames win))))

;; save & restore group
(progn
  (defvar *zz-group-file* "~/.stumpwm-group"
    "group layout file name")
  (defcommand dump-group-file () ()
    "dump group"
    (dump-group-to-file *zz-group-file*))
  (defcommand restore-group-file () ()
    "restore group"
    (if (probe-file *zz-group-file*)
        (stumpwm::restore-from-file *zz-group-file*)
        (message "This no is ~a." *zz-group-file*))))

(defcommand htop () ()
  "Run htop"
  (run-or-raise "urxvt -name HTop -e htop" '(:instance "HTop")))

(defcommand tmux () ()
  "Run tmux"
  (run-or-raise "urxvt -name Tmux -e tmux" '(:instance "Tmux")))

(defcommand eval-shell (&optional (initial "")) (:rest)
  "shell interactive command, done to keep"
  (let ((cmd (read-one-line (current-screen) "shell: " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec urxvt -e bash -c '~a; bash -l'"
                            cmd)
                    t))))

(defcommand eval-command (&optional (initial "")) (:rest)
  "shell interactive command, done to exit"
  (let ((cmd (read-one-line (current-screen) "cmd: " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec urxvt -e bash -c '~a; read'"
                            cmd)
                    t))))

(defcommand trans-command (&optional (initial "")) (:rest)
  "shell interactive command, done to exit"
  (let ((cmd (read-one-line (current-screen) "trans: " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command
       (format nil "exec urxvt -title 'trans' -e bash -c 'trans -no-warn ~a; read'"
               cmd)
       t))))

(defcommand trans-shell () ()
  "trans shell"
  (run-shell-command "exec urxvt -title 'trans' -e bash -c 'trans -I'"))

(defcommand ssh-shell (&optional (initial "")) (:rest)
  "ssh shell"
  (let ((cmd (read-one-line (current-screen) "ssh: " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec urxvt -e ssh ~a"
                            cmd)
                    t))))

(defcommand manpage (command) ((:rest "manpage: "))
  "manpage reader. needs filename completion, etc.."
  (run-shell-command (format nil "urxvt -e man ~a" command)))

(defcommand wifi-toggle () ()
  "wifi toggle"
  (message "~a"
           (run-shell-command
            (format nil "~a"
                    (merge-pathnames "libexec/wifi-toggle" *zz-load-directory*)) t)))

(defcommand touchpad-toggle () ()
  "touchpad toggle"
  (message "~a"
           (run-shell-command
            (format nil "~a"
                    (merge-pathnames "libexec/touchpad-toggle" *zz-load-directory*)) t)))

(defcommand touchpad-on () ()
  "touchpad toggle on"
  (message "~a"
           (run-shell-command
            (format nil "~a on"
                    (merge-pathnames "libexec/touchpad-toggle" *zz-load-directory*)) t)))

(defcommand touchpad-off () ()
  "touchpad toggle off"
  (message "~a"
           (run-shell-command
            (format nil "~a off"
                    (merge-pathnames "libexec/touchpad-toggle" *zz-load-directory*)) t)))

(defcommand bpython () ()
  "bpython"
  (run-shell-command "exec urxvt -e bpython"))

(defcommand swank-start () ()
  "Start swank server."
  (swank-start-server))

(defcommand swank-stop () ()
  "Stop swank server."
  (swank-stop-server))

(defcommand swank-toggle () ()
  "toggle swank server."
  (if *swank-server-running*
      (swank-stop-server)
      (swank-start-server)))

(defcommand debug-enable () ()
  "debug enable"
  (setf stumpwm::*debug-level* 10))

(defcommand debug-disable () ()
  "debug disable"
  (setf stumpwm::*debug-level* 0))
