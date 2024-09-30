;;;; applet setting -*-lisp-*-
;;

(in-package :zwm)

;; webjumps q=query+goes+here
(make-web-jump "google"    "firefox https://www.google.com/search?q=")
(make-web-jump "bing"      "firefox https://www.bing.com/search?q=")
(make-web-jump "wikipedia" "firefox https://en.wikipedia.org/w/index.php?search=")

;; run-or-raise via class
(def-run-or-raise-command audacity             '(:class "Audacity"))
(def-run-or-raise-command bcompare             '(:class "Bcompare"))
(def-run-or-raise-command cheese               '(:class "Cheese"))
(def-run-or-raise-command code                 '(:class "Code"))
(def-run-or-raise-command cherrytree           '(:Class "Cherrytree"))
(def-run-or-raise-command claws-mail           '(:Class "Claws-mail"))
(def-run-or-raise-command deadbeef             '(:Class "Deadbeef"))
(def-run-or-raise-command drawio               '(:class "draw.io"))
(def-run-or-raise-command evolution            '(:class "Evolution"))
(def-run-or-raise-command firefox              '(:class "firefox"))
(def-run-or-raise-command google-chrome        '(:class "Google-chrome"))
(def-run-or-raise-command gvim                 '(:class "Gvim"))
(def-run-or-raise-command iptux                '(:class "Iptux"))
(def-run-or-raise-command intel-unite-client   '(:class "Intel Unite"))
(def-run-or-raise-command klavaro              '(:class "Klavaro"))
(def-run-or-raise-command mpv                  '(:class "mpv"))
(def-run-or-raise-command meld                 '(:class "Meld"))
(def-run-or-raise-command ocenaudio            '(:class "ocenaudio"))
(def-run-or-raise-command openshot             '(:class "openshot"))
(def-run-or-raise-command remmina              '(:Class "org.remmina.Remmina"))
(def-run-or-raise-command slingscold           '(:Class "Slingscold"))
(def-run-or-raise-command thunar               '(:class "Thunar"))
(def-run-or-raise-command urxvt                '(:class "URxvt"))
(def-run-or-raise-command st                   '(:class "st-256color"))
(def-run-or-raise-command vlc                  '(:class "Vlc"))
(def-run-or-raise-command wireshark            '(:class "Wireshark"))
(def-run-or-raise-command pavucontrol          '(:class "Pavucontrol"))
(def-run-or-raise-command vmware-view          '(:class "Vmware-view"))

;; run-or-raise via instance
(def-run-or-raise-command libreoffice          '(:instance "libreoffice"))

;; run-or-raise-terminal
(def-run-or-raise-terminal bpython)
(def-run-or-raise-terminal htop)
(def-run-or-raise-terminal tmux)
(def-run-or-raise-terminal screen)

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

(defvar *win-cls* "zach-win" "rdp window classs")
(defcommand zach-nuc () ()
  "run remote zach-nuc"
  (let* ((prefix "xfreerdp ~/.zach-nuc.rdp")
         (cls *win-cls*)
         (cmd (format nil "~a -grab-keyboard /wm-class:~a"
                      prefix
                      cls)))
    (run-shell-command cmd)))
(defcommand zach-win () ()
  "run remote zach-win"
  (let* ((prefix "xfreerdp ~/.zach-nuc.rdp")
         (cls *win-cls*)
         (cmd (format nil "~a -grab-keyboard /wm-class:~a"
                      prefix
                      cls)))
    (run-or-raise cmd `(:class ,cls))))

(defcommand onlyoffice () ()
  "run onlyoffice"
  (let ((cls "DesktopEditors")
        (cmd "onlyoffice"))
    (run-or-raise cmd `(:class ,cls))))

(defcommand runurxvt () ()
  "run urxvt"
  (run-or-raise-prefer-group "urxvt" "URxvt"))

(defcommand pullurxvt () ()
  "pull urxvt"
  (run-or-pull-prefer-group "urxvt" "URxvt"))

(defcommand nnn () ()
  "run or raise nnn"
  (let* ((name "nnn")
         (cmd (format nil "~a -e" name))
         (line (format nil "urxvt -name ~a -e ~a" name cmd)))
    (run-or-raise line `(:instance ,name))))

(defcommand urxvtclient () ()
  "run urxvt client"
  (run-shell-command "urxvtc"))

(defcommand runemacs () ()
  "run emacs"
  (run-or-raise-prefer-group "emacsclient -c -a emacs" "Emacs"))

(defcommand pullemacs () ()
  "pull emacs"
  (run-or-pull-prefer-group "emacsclient -c -a emacs" "Emacs"))

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

(defcommand eval-shell (&optional (initial "")) (:rest)
  "shell interactive command, done to keep"
  (let ((cmd (read-one-line (current-screen) "$ " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec urxvt -e bash -c '~a; bash -l'"
                            cmd)
                    t))))

(defcommand eval-cmd (&optional (initial "")) (:rest)
  "shell interactive command, done to exit"
  (let ((cmd (read-one-line (current-screen) "$ " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec urxvt -e bash -c '~a; read'"
                            cmd)
                    t))))

(defcommand trans-cmd (&optional (initial "")) (:rest)
  "shell interactive command, done to exit"
  (let ((cmd (read-one-line (current-screen) "Trans: " :initial-input initial)))
    (when cmd
      (stumpwm::eval-command
       (format nil "exec urxvt -title 'trans' -e bash -c 'trans -no-warn ~a; read'"
               cmd)
       t))))

(defcommand trans-shell () ()
  "trans shell"
  (run-shell-command "exec urxvt -title 'trans' -e bash -c 'trans -I'"))

(defcommand ssh (&optional (initial "")) (:rest)
  "ssh shell"
  (let ((cmd (completing-read (current-screen) "Host: " (filter-hosts) :initial-input initial)))
    (when cmd
      (stumpwm::eval-command (format nil "exec st -f \"SF Mono:size=13\" -e ssh ~a"
                            cmd)
                    t))))

(defcommand manpage (command) ((:rest "Man: "))
  "manpage reader. needs filename completion, etc.."
  (run-shell-command (format nil "st -f \"SF Mono:size=13\" -e man ~a" command)))

(defcommand scrot-full () ()
  "screenshot full"
  (let ((cmd (format nil "~a full"
                     (merge-pathnames "libexec/screen-snap" *zz-load-directory*))))
    (message (run-shell-command cmd t))))

(defcommand scrot-window () ()
  "screenshot windows"
  (let ((cmd (format nil "~a window"
                     (merge-pathnames "libexec/screen-snap" *zz-load-directory*))))
    (message (run-shell-command cmd t))))

(defcommand scrot-select () ()
  "screenshot select"
  (let ((cmd (format nil "~a region"
                     (merge-pathnames "libexec/screen-snap" *zz-load-directory*))))
    (message (run-shell-command cmd t))))

(defcommand clipboard-full () ()
  "screen clipboard fullscreen"
  (let ((cmd (format nil "~a full"
                     (merge-pathnames "libexec/screen-clipboard" *zz-load-directory*)))
        (msg "Screen full to clipboard"))
    (message msg)
    (run-shell-command cmd)))

(defcommand clipboard-window () ()
  "screen clipboard window"
  (let ((cmd (format nil "~a window"
                     (merge-pathnames "libexec/screen-clipboard" *zz-load-directory*)))
        (msg "Screen window to clipboard"))
    (message msg)
    (run-shell-command cmd)))

(defcommand clipboard-select () ()
  "screen clipboard region"
  (let ((cmd (format nil "~a region"
                     (merge-pathnames "libexec/screen-clipboard" *zz-load-directory*)))
        (msg "Screen region to clipboard"))
    (message msg)
    (run-shell-command cmd)))

(defcommand transset () ()
  "transparent window"
  (let ((cmd "transset")
        (msg "Please select window to transparent"))
    (message msg)
    (run-shell-command cmd)))

(defcommand translate () ()
  "open translate website"
  (let ((cmd "xdg-open https://translate.google.com/"))
    (run-shell-command cmd)))

(defcommand outlook () ()
  "run or raise outlook"
  (let* ((name "pkooggnaalmfkidjmlhoelhdllpphaga")
         (cmd (format nil "google-chrome --profile-directory=Default --app-id=~a" name)))
    (run-or-raise cmd `(:instance ,name))))

(defcommand office () ()
  "run or raise office"
  (let* ((name "onhfoihkhodaeblmangmjjgfpfehnlkm")
         (cmd (format nil "google-chrome --profile-directory=Default --app-id=~a" name)))
    (run-or-raise cmd `(:instance ,name))))

(defcommand onedrive () ()
  "run or raise onedrive"
  (let* ((name "jgajkdfdncijdhpgnkmjghkpdkgcjmkn")
         (cmd (format nil "google-chrome --profile-directory=Default --app-id=~a" name)))
    (run-or-raise cmd `(:instance ,name))))

(defcommand teams () ()
  "run or raise teams PWA"
  (let* ((name "cifhbcnohmdccbgoicgdjpfamggdegmo")
         (cmd (format nil "google-chrome --profile-directory=Default --app-id=~a" name)))
    (run-or-raise cmd `(:instance ,name))))

(defcommand teamsapp () ()
  "run or raise teams"
  (let* ((name "Microsoft Teams - Preview")
         (cmd "teams"))
    (run-or-raise cmd `(:class ,name))))

(defcommand teams-force () ()
  "teams force"
  (let ((cmd (format nil "~a"
                     (merge-pathnames "libexec/teams-force" *zz-load-directory*))))
    (run-shell-command cmd)))

(defcommand evolution-force () ()
  "evolution force"
  (let ((cmd (format nil "~a"
                     (merge-pathnames "libexec/evolution-force" *zz-load-directory*))))
    (run-shell-command cmd)))
