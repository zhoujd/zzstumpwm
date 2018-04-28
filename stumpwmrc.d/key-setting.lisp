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
  (kbd "s-e")       "emacs"
  (kbd "C-e")       "exec emacs"
  (kbd "f")         "firefox"
  (kbd "C-f")       "exec firefox"
  (kbd "m")         "exec gnome-system-monitor"
  (kbd "n")         "exec nautilus --no-desktop"
  (kbd "t")         "exec xterm"
  (kbd "C-t")       "exec gnome-terminal"
  (kbd "M-t")       (xterm-command "tmux")
  (kbd "v")         (xterm-command "vim")
  (kbd "C-v")       "exec evince"
  (kbd "b")         "colon1 exec firefox http://www."
  (kbd "s")         "colon1 exec xterm -e ssh "
  ))

;; *zz-x-map*
(apply-keys-to-map
 *zz-x-map*
 (list
  (kbd "1")         "only"
  (kbd "2")         "vsplit"
  (kbd "3")         "hsplit"
  (kbd "4")         "kill-window"
  (kbd "5")         "fselect"
  (kbd "6")         "balance-frames"
  (kbd "7")         "refresh"
  (kbd "8")         "delete-window"
  (kbd "9")         "iresize"
  (kbd "0")         "remove-split"

  ;; exchange-direction bound to C-t x by defalut
  ;; https://stumpwm.github.io/git/stumpwm-git_6.html#Frames
  (kbd "Left")      "exchange-direction left"
  (kbd "Right")     "exchange-direction right"
  (kbd "Up")        "exchange-direction up"
  (kbd "Down")      "exchange-direction down"
  ))

;; *zz-help-map*
(apply-keys-to-map
 *zz-help-map*
 (list
  (kbd "m")         (format nil "exec xterm -e info ~a"
                            (merge-pathnames "doc/stumpwm.info" *zz-load-directory*))
  (kbd "C-m")       "exec firefox http://stumpwm.org/manual/stumpwm.html"
  (kbd "s")         "exec firefox http://lxr.free-electrons.com/"
  (kbd "C-s")       "exec firefox http://svnweb.freebsd.org/"
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
  (kbd "s-C-`")     "grouplist"

  (kbd "s-l")       "exec xtrlock"
  (kbd "s-C-l")     "exec slock"
  (kbd "s-M-l")     "exec xset dpms force off"

  (kbd "s-Tab")     "pull-hidden-next"

  (kbd "Print")     "screenshot"
  (kbd "M-Print")   "screenshot-window"

  (kbd "s-C-b")     "mode-line"
  (kbd "s-C-q")     "quit"
  (kbd "s-C-r")     "reinit"

  (kbd "s-F1")      "lastmsg"
  (kbd "s-C-F1")    "version"
  (kbd "s-F2")      "exec"
  (kbd "s-C-F2")    "exec dmenu_run -fn consola-13"
  (kbd "s-F3")      "dump-desktop-to-file ~/.stumpwm-desktop"
  (kbd "s-C-F3")    "restore-from-file ~/.stumpwm-desktop"
  (kbd "s-F4")      "kill"
  (kbd "s-C-F4")    "gkill"

  (kbd "s-F5")      "gnew f5"
  (kbd "s-C-F5")    "gnew-float f5-float"
  (kbd "s-F6")      "gnew f6"
  (kbd "s-C-F6")    "gnew-float f6-float"
  (kbd "s-F7")      "gnew f7"
  (kbd "s-C-F7")    "gnew-float f7-float"
  (kbd "s-F8")      "gnew f8"
  (kbd "s-C-F8")    "gnew-float f8-float"
  
  (kbd "s-F9")      "gother"
  (kbd "s-C-F9")    "gselect"
  (kbd "s-F10")     "fclear"
  (kbd "s-C-F10")   "fullscreen"  
  (kbd "s-F11")     "colon"
  (kbd "s-C-F11")   "eval"
  (kbd "s-F12")     "abort"
  (kbd "s-C-F12")   "banish"

  (kbd "s-Left")    "move-focus left"
  (kbd "s-Right")   "move-focus right"
  (kbd "s-Up")      "move-focus up"
  (kbd "s-Down")    "move-focus down"

  (kbd "s-M-Left")  "move-window left"
  (kbd "s-M-Right") "move-window right"
  (kbd "s-M-Up")    "move-window up"
  (kbd "s-M-Down")  "move-window down"

  (kbd "s-C-Left")  "prev-in-frame"
  (kbd "s-C-Right") "next-in-frame"
  (kbd "s-C-Up")    "gprev"
  (kbd "s-C-Down")  "gnext"
  ))

;; input map
(apply-keys-to-map
 *input-map*
 (list
  (kbd "C-m")       'input-submit
  (kbd "C-h")       'input-delete-backward-char
  (kbd "M-p")       'input-history-back
  (kbd "M-n")       'input-history-forward
  (kbd "C-i")       'input-complete-forward
  ))
