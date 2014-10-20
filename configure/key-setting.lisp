;;;; key setting -*-lisp-*-
;;

(in-package :stumpwm)

;; *zz-exec-map*
(apply-keys-to-map
 *zz-exec-map*
 (list
  (kbd "c")         "gnome-control-center"
  (kbd "C-c")       "exec gnome-control-center"
  (kbd "M-c")       (gnome-term-command "sudo gnome-control-center")
  (kbd "e")         "emacs"
  (kbd "C-e")       "exec emacs"
  (kbd "f")         "firefox"
  (kbd "C-f")       "exec firefox"
  (kbd "m")         "exec gnome-system-monitor"
  (kbd "n")         "exec nautilus --no-desktop"
  (kbd "t")         "exec gnome-terminal"
  (kbd "v")         (gnome-term-command "vim")
  (kbd "C-v")       "exec evince"
  ))

;; *zz-x-map*
(apply-keys-to-map
 *zz-x-map*
 (list
  (kbd "0")         "remove"
  (kbd "1")         "only"
  (kbd "2")         "vsplit"
  (kbd "3")         "hsplit"
  ))

;; *zz-help-map*
(apply-keys-to-map
 *zz-help-map*
 (list
  (kbd "m")         (format nil "exec xterm -e info ~a"
                            (merge-pathnames "doc/stumpwm.info" *zz-load-directory*))
  (kbd "C-m")       "exec firefox http://stumpwm.org/manual/stumpwm.html"

  (kbd "v")         "describe-variable"
  (kbd "f")         "describe-function"
  (kbd "k")         "describe-key"
  (kbd "w")         "where-is"
  ))

;; top map
(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-`")       "windowlist"
  (kbd "s-l")       "exec xtrlock"
  (kbd "s-Tab")     "pull-hidden-next"
  (kbd "Print")     "exec scrot -q 10"
  (kbd "M-Print")   "exec scrot -q 10 -s"

  (kbd "s-C-b")     "mode-line"
  (kbd "s-C-q")     "quit"
  (kbd "s-C-r")     "reinit"

  (kbd "s-F2")      "exec"
  (kbd "s-F4")      "kill"
  (kbd "s-F11")     "reboot"
  (kbd "s-F12")     "shutdown"
  (kbd "s-C-F11")   (gnome-term-command "sudo reboot")
  (kbd "s-C-F12")   (gnome-term-command "sudo shutdown -h now")

  (kbd "s-Right")   "move-focus right"
  (kbd "s-Left")    "move-focus left"
  (kbd "s-Up")      "move-focus up"
  (kbd "s-Down")    "move-focus down"

  (kbd "s-M-Right") "move-window right"
  (kbd "s-M-Left")  "move-window left"
  (kbd "s-M-Up")    "move-window up"
  (kbd "s-M-Down")  "move-window down"

  (kbd "s-C-Right") "gnext"
  (kbd "s-C-Left")  "gprev"
  (kbd "s-C-Up")    "prev-in-frame"
  (kbd "s-C-Down")  "next-in-frame"
  ))

;; root map
(apply-keys-to-map
 *root-map*
 (list
  (kbd "s-i")       "current-window-info"
  ))

;; input map
(apply-keys-to-map
 *input-map*
 (list
  (kbd "C-m") 'input-submit
  (kbd "C-h") 'input-delete-backward-char
  (kbd "M-p") 'input-history-back
  (kbd "M-n") 'input-history-forward
  (kbd "C-i") 'input-complete-forward
  ))
