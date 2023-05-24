;;;; Number 1 to 12 setting -*-lisp-*-
;;

(in-package :zwm)

(apply-keys-to-map
 *zz-exec-map*
 (list
  (kbd "1")                 "runemacs"
  (kbd "2")                 "google-chrome"
  (kbd "3")                 "teams"
  (kbd "4")                 "outlook"
  (kbd "5")                 "libreoffice"
  (kbd "6")                 "exec libreoffice --writer"
  (kbd "7")                 "exec libreoffice --calc"
  (kbd "8")                 "exec libreoffice --impress"
  (kbd "9")                 "trans-shell"
  (kbd "0")                 "trans-cmd"
  (kbd "-")                 "eval-cmd"
  (kbd "=")                 "eval-shell"
  ))

(apply-keys-to-map
 *zz-x-map*
 (list
  (kbd "1")                 "only"
  (kbd "2")                 "vsplit"
  (kbd "3")                 "hsplit"
  (kbd "4")                 "kill"
  (kbd "0")                 "remove"
  ))

(apply-keys-to-map
 *zz-screen-map*
 (list
  (kbd "1")                 "pactl-toggle"
  (kbd "2")                 "pactl-down"
  (kbd "3")                 "pactl-up"
  (kbd "4")                 "pactl-mic-toggle"
  (kbd "5")                 "exec xdotool key F5"
  (kbd "6")                 "touchpad-toggle"
  (kbd "7")                 "wifi-toggle"
  (kbd "8")                 "cheese"
  (kbd "9")                 "exec zlock"
  (kbd "0")                 "screen-menu"
  (kbd "-")                 "bright-down"
  (kbd "=")                 "bright-up"
  ))

(apply-keys-to-map
 *zz-c-map*
 (list
  (kbd "1")                 (rat-click 1)   ;;left
  (kbd "2")                 (rat-click 2)   ;;middle
  (kbd "3")                 (rat-click 3)   ;;right
  (kbd "4")                 (rat-click 4)   ;;wheel up
  (kbd "5")                 (rat-click 5)   ;;whell down
  (kbd "-")                 "pactl-test"
  (kbd "=")                 "pactl-mic-test"
  ))

(apply-keys-to-map
 *zz-func-map*
 (list
  (kbd "1")                 "group-print"
  (kbd "M-1")               "group-move"
  (kbd "2")                 "exec rofi -show run"
  (kbd "M-2")               "exec rofi -show drun"
  (kbd "3")                 "window-other"
  (kbd "M-3")               "gother"
  (kbd "4")                 "window-kill"
  (kbd "M-4")               "group-kill"
  (kbd "5")                 "gnew f5"
  (kbd "M-5")               "gnew-float f5-float"
  (kbd "6")                 "gnew f6"
  (kbd "M-6")               "gnew-float f6-float"
  (kbd "7")                 "gnew f7"
  (kbd "M-7")               "gnew-float f7-float"
  (kbd "8")                 "gnew f8"
  (kbd "M-8")               "gnew-float f8-float"
  (kbd "9")                 "gnew Default"
  (kbd "M-9")               "gselect"
  (kbd "0")                 "gnew1"
  (kbd "M-0")               "gnew-float1"
  (kbd "-")                 "colon1"
  (kbd "M--")               "eval1"
  (kbd "=")                 "lastmsg"
  (kbd "M-=")               "echo-date"

  (kbd "C-1")               "emacs"
  (kbd "C-2")               "google-chrome"
  (kbd "C-3")               "teams"
  (kbd "C-4")               "evolution"
  (kbd "C-5")               "nnn"
  (kbd "C-6")               "mpv"
  (kbd "C-7")               "deadbeef"
  (kbd "C-8")               "tmux"
  (kbd "C-9")               "urxvt"
  (kbd "C-0")               "thunar"
  (kbd "C--")               "pactl-test"
  (kbd "C-=")               "pactl-mic-test"

  (kbd "!")                 "outlook"
  (kbd "@")                 "office"
  (kbd "#")                 "onedrive"
  (kbd "$")                 "translate"
  (kbd "%")                 "colon1 exec xdg-open http://"
  (kbd "^")                 "vpn-menu"
  (kbd "&")                 "wifi-menu"
  (kbd "*")                 "tmux-menu"
  (kbd "(")                 "audio-menu"
  (kbd ")")                 "screen-menu"
  (kbd "_")                 "bright-down"
  (kbd "+")                 "bright-up"
  ))
