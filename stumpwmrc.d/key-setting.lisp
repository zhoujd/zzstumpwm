;;;; key setting -*-lisp-*-
;;

(in-package :stumpwm)

;; *zz/exec-map*
(zz/apply-keys-to-map
 *zz/exec-map*
 (list
  (kbd "a")             (zz/urxvt-command "alsamixer")
  (kbd "C-a")           (zz/urxvt-command "alsamixer -c 1")
  (kbd "M-a")           "exec pavucontrol"
  (kbd "b")             "zz/colon1 exec firefox http://www."
  (kbd "C-b")           "zz/google"
  (kbd "M-b")           "zz/wikipedia"
  (kbd "s-b")           "zz/bing"
  (kbd "c")             "zz/urxvt"
  (kbd "C-c")           "exec urxvt"
  (kbd "s-c")           "zz/sakura"
  (kbd "M-c")           "exec sakura"
  (kbd "d")             "zz/deadbeef"
  (kbd "e")             "zz/runemacs"
  (kbd "s-e")           "emacs"
  (kbd "C-e")           "exec emacs"
  (kbd "M-e")           "exec emacsclient -c -a emacs"
  (kbd "f")             "zz/firefox"
  (kbd "C-f")           "exec firefox"
  (kbd "M-f")           "zz/surf"
  (kbd "g")             "zz/google-chrome"
  (kbd "M-g")           "exec google-chrome"
  (kbd "h")             "zz/thunar"
  (kbd "C-h")           "exec thunar"
  (kbd "m")             "zz/evolution"
  (kbd "n")             (zz/urxvt-command "nano")
  (kbd "C-n")           "exec cherrytree"
  (kbd "p")             "zz/pidgin"
  (kbd "C-p")           "zz/teams"
  (kbd "r")             "exec remmina"
  (kbd "C-r")           (zz/urxvt-command "ranger")
  (kbd "t")             (zz/urxvt-command "tmux")
  (kbd "C-t")           (zz/urxvt-command "byobu")
  (kbd "s")             "zz/colon1 exec urxvt -e ssh "
  (kbd "C-s")           (zz/urxvt-command "speedpad")
  (kbd "M-s")           "zz/stumpish"
  (kbd "u")             "zz/intel-unite-client"
  (kbd "v")             (zz/urxvt-command "vim")
  (kbd "M-v")           "exec VQAnalyzer"
  ))

;; *zz/x-map*
(zz/apply-keys-to-map
 *zz/x-map*
 (list
  (kbd "1")             "only"
  (kbd "2")             "vsplit"
  (kbd "3")             "hsplit"
  (kbd "4")             "kill"
  (kbd "0")             "remove"
  (kbd "-")             "dump-desktop-to-file ~/.stumpwm-desktop"
  (kbd "=")             "restore-from-file ~/.stumpwm-desktop"

  (kbd "c")             "fclear"
  (kbd "d")             "delete"
  (kbd "i")             "zz/window-info"
  (kbd "m")             "fselect"
  (kbd "o")             "fother"
  (kbd "q")             "zz/system-action"
  ))

;; *zz/help-map*
(zz/apply-keys-to-map
 *zz/help-map*
 (list
  (kbd "m")             "zz/stumpwm-manual"
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
(zz/apply-keys-to-map
 *input-map*
 (list
  (kbd "C-m")           'input-submit
  (kbd "C-h")           'input-delete-backward-char
  (kbd "M-p")           'input-history-back
  (kbd "M-n")           'input-history-forward
  (kbd "C-i")           'input-complete-forward
  ))

;; menu map
(zz/apply-keys-to-map
 *menu-map*
 (list
  (kbd "C-h")           'menu-backspace
  (kbd "M-p")           'menu-scroll-up
  (kbd "M-n")           'menu-scroll-down
  ))

;; top map
(zz/apply-keys-to-map
 *top-map*
 (list
  (kbd "s-`")           "windowlist"
  (kbd "s-M-`")         "grouplist"
  (kbd "s-C-`")         "zz/skippy"
  (kbd "s-'")           "windowlist"
  (kbd "s-M-'")         "grouplist"
  (kbd "s-C-'")         "zz/skippy"

  (kbd "s-Escape")      "abort"
  (kbd "s-M-Escape")    "banish"

  (kbd "s-Tab")         "pull-hidden-next"
  (kbd "s-M-Tab")       "gnext"
  (kbd "s-BackSpace")   "pull-hidden-next"
  (kbd "s-M-BackSpace") "gnext"

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
  (kbd "s-M-?")         "exec rofi -show keys"

  (kbd "s-C-b")         "mode-line"
  (kbd "s-C-d")         "zz/safe-delete"
  (kbd "s-C-q")         "zz/kill-stumpwm"
  (kbd "s-C-r")         "zz/reinit"

  (kbd "s-[")           "prev-in-frame"
  (kbd "s-]")           "next-in-frame"
  (kbd "s-M-[")         "gprev"
  (kbd "s-M-]")         "gnext"

  (kbd "s-\\")          "iresize"
  (kbd "s-M-\\")        "balance-frames"

  (kbd "s-,")           "amixer-Master-1-"
  (kbd "s-.")           "amixer-Master-1+"
  (kbd "s-m")           "amixer-Master-toggle pulse"

  (kbd "s-;")           "colon"
  (kbd "s-M-;")         "eval"
  ))

(zz/apply-keys-to-map
 *root-map*
 (list
  (kbd "c")             "zz/urxvt"
  (kbd "C-c")           "exec urxvt"
  ))

(zz/apply-keys-to-map
 *zz/screen-map*
 (list
  (kbd "d")             "zz/toggle-root"

  (kbd "k")             "sprev"
  (kbd "j")             "snext"
  (kbd "o")             "sother"

  (kbd "l")             "exec xtrlock"
  (kbd "M-l")           "exec slock"

  (kbd "r")             "zz/resolution"
  (kbd "b")             "zz/show-battery"

  (kbd "0")             "zz/bright-setup"
  (kbd "-")             "zz/bright-down"
  (kbd "=")             "zz/bright-up"

  (kbd "p")             "zz/scrot-window"
  (kbd "C-p")           "zz/scrot-full"
  (kbd "M-p")           "zz/scrot-select"
  ))

(zz/apply-keys-to-map
 *top-map*
 (list
  (kbd "s-h")           (zz/getkey-top (kbd "s-Left"))
  (kbd "s-l")           (zz/getkey-top (kbd "s-Right"))
  (kbd "s-k")           (zz/getkey-top (kbd "s-Up"))
  (kbd "s-j")           (zz/getkey-top (kbd "s-Down"))

  (kbd "s-M-h")         (zz/getkey-top (kbd "s-M-Left"))
  (kbd "s-M-l")         (zz/getkey-top (kbd "s-M-Right"))
  (kbd "s-M-k")         (zz/getkey-top (kbd "s-M-Up"))
  (kbd "s-M-j")         (zz/getkey-top (kbd "s-M-Down"))

  (kbd "s-C-h")         (zz/getkey-top (kbd "s-C-Left"))
  (kbd "s-C-l")         (zz/getkey-top (kbd "s-C-Right"))
  (kbd "s-C-k")         (zz/getkey-top (kbd "s-C-Up"))
  (kbd "s-C-j")         (zz/getkey-top (kbd "s-C-Down"))
  ))

(zz/apply-keys-to-map
 *zz/c-map*
 (list
  (kbd "b")             (zz/getkey-top (kbd "s-Left"))
  (kbd "f")             (zz/getkey-top (kbd "s-Right"))
  (kbd "p")             (zz/getkey-top (kbd "s-Up"))
  (kbd "n")             (zz/getkey-top (kbd "s-Down"))

  (kbd "M-b")           (zz/getkey-top (kbd "s-M-Left"))
  (kbd "M-f")           (zz/getkey-top (kbd "s-M-Right"))
  (kbd "M-p")           (zz/getkey-top (kbd "s-M-Up"))
  (kbd "M-n")           (zz/getkey-top (kbd "s-M-Down"))

  (kbd "C-b")           (zz/getkey-top (kbd "s-C-Left"))
  (kbd "C-f")           (zz/getkey-top (kbd "s-C-Right"))
  (kbd "C-p")           (zz/getkey-top (kbd "s-C-Up"))
  (kbd "C-n")           (zz/getkey-top (kbd "s-C-Down"))

  (kbd "k")             "zz/key-layout"
  (kbd "l")             "zz/capslock-toggle"
  ))
