;;;; Number 1 to 12 setting -*-lisp-*-
;;

(in-package :zwm)

(apply-keys-to-map
 *zz-exec-map*
 (list
  (kbd "1")                 "runemacs"
  (kbd "2")                 "google-chrome"
  (kbd "3")                 "teams"
  (kbd "4")                 "evolution"
  (kbd "5")                 "libreoffice"
  (kbd "6")                 "exec libreoffice --writer"
  (kbd "7")                 "exec libreoffice --calc"
  (kbd "8")                 "exec libreoffice --impress"
  (kbd "9")                 "trans-shell"
  (kbd "0")                 "trans-line"
  (kbd "-")                 "eval-line"
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
  ))
