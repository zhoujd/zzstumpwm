;;;; key setting -*-lisp-*-
;;

(in-package :stumpwm)

;; *zz-exec-map*
(apply-keys-to-map
 *zz-exec-map*
 (list
  (kbd "c")             "urxvt"
  (kbd "C-c")           "exec urxvt"
  (kbd "e")             "runemacs"
  (kbd "s-e")           "emacs"
  (kbd "C-e")           "exec emacs"
  (kbd "f")             "firefox"
  (kbd "C-f")           "exec firefox"
  (kbd "M-f")           "surf"
  (kbd "v")             (urxvt-command "vim")
  (kbd "C-v")           "exec evince"
  (kbd "M-v")           "exec VCA"
  (kbd "r")             (urxvt-command "ranger")
  (kbd "C-r")           "exec remmina"
  (kbd "t")             (urxvt-command "tmux")
  (kbd "C-t")           (urxvt-command "byobu")
  (kbd "b")             "colon1 exec firefox http://www."
  (kbd "C-b")           "google"
  (kbd "M-b")           "wikipedia"
  (kbd "s-b")           "bing"
  (kbd "s")             "colon1 exec urxvt -e ssh "
  (kbd "C-s")           (urxvt-command "speedpad")
  (kbd "M-s")           "stumpish"
  (kbd "w")             "exec wicd-client -n"
  ))

;; *zz-x-map*
(apply-keys-to-map
 *zz-x-map*
 (list
  (kbd "1")             "only"
  (kbd "2")             "vsplit"
  (kbd "3")             "hsplit"
  (kbd "4")             "kill"
  (kbd "5")             "fselect"
  (kbd "6")             "fnext"
  (kbd "7")             "fother"
  (kbd "8")             "fclear"
  (kbd "9")             "delete"
  (kbd "0")             "remove"
  (kbd "-")             "dump-desktop-to-file ~/.stumpwm-desktop"
  (kbd "=")             "restore-from-file ~/.stumpwm-desktop"

  (kbd "i")             "window-info"
  (kbd "k")             "key-layout"
  (kbd "l")             "exec setcapslock toggle"
  (kbd "q")             "kill-stumpwm"
  ))

;; *zz-help-map*
(apply-keys-to-map
 *zz-help-map*
 (list
  (kbd "m")             "stumpwm-manual"
  (kbd "M-m")           "exec firefox http://stumpwm.org/manual/stumpwm.html"
  (kbd "s")             "exec firefox http://lxr.free-electrons.com/"
  (kbd "M-s")           "exec firefox http://svnweb.freebsd.org/"

  (kbd "v")             "describe-variable"
  (kbd "f")             "describe-function"
  (kbd "k")             "describe-key"
  (kbd "c")             "describe-command"
  (kbd "w")             "where-is"

  (kbd "M-c")           "commands"
  (kbd "M-v")           "version"
  ))

;; input map
(apply-keys-to-map
 *input-map*
 (list
  (kbd "C-m")           'input-submit
  (kbd "C-h")           'input-delete-backward-char
  (kbd "M-p")           'input-history-back
  (kbd "M-n")           'input-history-forward
  (kbd "C-i")           'input-complete-forward
  ))

;; top map
(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-`")           "windowlist"
  (kbd "s-M-`")         "grouplist"

  (kbd "s-Escape")      "abort"
  (kbd "s-M-Escape")    "banish"

  (kbd "s-Tab")         "pull-hidden-next"
  (kbd "s-M-Tab")       "gnext"

  (kbd "s-BackSpace")   "pull-hidden-next"
  (kbd "s-M-BackSpace") "gnext"

  (kbd "Print")         "screenshot"
  (kbd "M-Print")       "screenshot-window"

  (kbd "s-Left")        "move-focus left"
  (kbd "s-Right")       "move-focus right"
  (kbd "s-Up")          "move-focus up"
  (kbd "s-Down")        "move-focus down"

  (kbd "s-M-Left")      "move-window left"
  (kbd "s-M-Right")     "move-window right"
  (kbd "s-M-Up")        "move-window up"
  (kbd "s-M-Down")      "move-window down"

  (kbd "s-C-Left")      "exchange-direction left"
  (kbd "s-C-Right")     "exchange-direction right"
  (kbd "s-C-Up")        "exchange-direction up"
  (kbd "s-C-Down")      "exchange-direction down"

  (kbd "s-M-r")         "exec rofi -show run"
  (kbd "s-M-s")         "exec rofi -show ssh"
  (kbd "s-M-w")         "exec rofi -show window"
  (kbd "s-M-d")         "exec rofi -show drun"

  (kbd "s-C-b")         "mode-line"
  (kbd "s-C-d")         "safe-delete"
  (kbd "s-C-q")         "kill-stumpwm"
  (kbd "s-C-r")         "reinit"

  (kbd "s-[")           "prev-in-frame"
  (kbd "s-]")           "next-in-frame"
  (kbd "s-M-[")         "gprev"
  (kbd "s-M-]")         "gnext"

  (kbd "s-\\")          "iresize"
  (kbd "s-M-\\")        "balance-frames"

  (kbd "s-,")           "amixer-Master-1-"
  (kbd "s-.")           "amixer-Master-1+"
  (kbd "s-m")           "amixer-Master-toggle pulse"
  ))

(apply-keys-to-map
 *root-map*
 (list
  (kbd "c")             "urxvt"
  (kbd "C-c")           "exec urxvt"
  ))

(apply-keys-to-map
 *zz-screen-map*
 (list
  (kbd "p")             "sprev"
  (kbd "n")             "snext"
  (kbd "o")             "sother"

  (kbd "l")             "exec xtrlock"
  (kbd "M-l")           "exec slock"

  (kbd "r")             "resolution"
  (kbd "b")             "show-battery"
  ))

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-h")           (getkey-top (kbd "s-Left"))
  (kbd "s-l")           (getkey-top (kbd "s-Right"))
  (kbd "s-k")           (getkey-top (kbd "s-Up"))
  (kbd "s-j")           (getkey-top (kbd "s-Down"))

  (kbd "s-M-h")         (getkey-top (kbd "s-M-Left"))
  (kbd "s-M-l")         (getkey-top (kbd "s-M-Right"))
  (kbd "s-M-k")         (getkey-top (kbd "s-M-Up"))
  (kbd "s-M-j")         (getkey-top (kbd "s-M-Down"))

  (kbd "s-C-h")         (getkey-top (kbd "s-C-Left"))
  (kbd "s-C-l")         (getkey-top (kbd "s-C-Right"))
  (kbd "s-C-k")         (getkey-top (kbd "s-C-Up"))
  (kbd "s-C-j")         (getkey-top (kbd "s-C-Down"))
  ))

(apply-keys-to-map
 *zz-c-map*
 (list
  (kbd "b")             (getkey-top (kbd "s-Left"))
  (kbd "f")             (getkey-top (kbd "s-Right"))
  (kbd "p")             (getkey-top (kbd "s-Up"))
  (kbd "n")             (getkey-top (kbd "s-Down"))

  (kbd "M-b")           (getkey-top (kbd "s-M-Left"))
  (kbd "M-f")           (getkey-top (kbd "s-M-Right"))
  (kbd "M-p")           (getkey-top (kbd "s-M-Up"))
  (kbd "M-n")           (getkey-top (kbd "s-M-Down"))

  (kbd "C-b")           (getkey-top (kbd "s-C-Left"))
  (kbd "C-f")           (getkey-top (kbd "s-C-Right"))
  (kbd "C-p")           (getkey-top (kbd "s-C-Up"))
  (kbd "C-n")           (getkey-top (kbd "s-C-Down"))
  ))
