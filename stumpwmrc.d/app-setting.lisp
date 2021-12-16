;;;; app setting -*-lisp-*-
;;

(in-package :zwm)

;; webjumps q=query+goes+here
(make-web-jump "google"    "firefox https://www.google.com/search?q=")
(make-web-jump "bing"      "firefox https://www.bing.com/search?q=")
(make-web-jump "wikipedia" "firefox https://en.wikipedia.org/w/index.php?search=")

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
(def-run-or-raise-command meld          '(:class "Meld"))
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

(defcommand scrot-full () ()
  "screenshot full"
  (screen-snap "scrot"))
(defcommand scrot-window () ()
  "screenshot windows"
  (screen-snap "scrot -u"))
(defcommand scrot-select () ()
  "screenshot select"
  (screen-snap "scrot -s"))