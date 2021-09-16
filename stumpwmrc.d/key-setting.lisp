;;;; key setting -*-lisp-*-
;;

(in-package :zwm)

;; *zz-exec-map*
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
  (kbd "0")                 "trans-command"
  (kbd "-")                 "eval-command"
  (kbd "=")                 "eval-shell"
  (kbd "a")                 "audacity"
  (kbd "C-a")               "exec audacity"
  (kbd "b")                 "google"
  (kbd "C-b")               "bing"
  (kbd "M-b")               "wikipedia"
  (kbd "c")                 "urxvt"
  (kbd "C-c")               "exec urxvt"
  (kbd "d")                 "deadbeef"
  (kbd "C-d")               "exec meld"
  (kbd "M-d")               "drawio"
  (kbd "e")                 "runemacs"
  (kbd "s-e")               "emacs"
  (kbd "C-e")               "exec emacs"
  (kbd "M-e")               "emacsclient"
  (kbd "f")                 "firefox"
  (kbd "C-f")               "exec firefox"
  (kbd "M-f")               "colon exec firefox http://"
  (kbd "g")                 "google-chrome"
  (kbd "M-g")               "colon exec google-chrome http://"
  (kbd "h")                 "thunar"
  (kbd "C-h")               "exec thunar"
  (kbd "M-h")               "exec thunar -B"
  (kbd "k")                 (urxvt-command "gtypist")
  (kbd "C-k")               "klavaro"
  (kbd "l")                 "libreoffice"
  (kbd "C-l")               "exec libreoffice"
  (kbd "m")                 "evolution"
  (kbd "C-m")               "claws-mail"
  (kbd "n")                 "cherrytree"
  (kbd "C-n")               "exec cherrytree"
  (kbd "p")                 "pidgin"
  (kbd "q")                 "slingscold"
  (kbd "C-q")               "exec slingscold"
  (kbd "r")                 "exec remmina"
  (kbd "C-r")               (urxvt-command "ranger")
  (kbd "t")                 "teams"
  (kbd "C-t")               (urxvt-command "tmux")
  (kbd "M-t")               "tmux"
  (kbd "s")                 (urxvt-command "speedpad")
  (kbd "C-s")               "stumpish"
  (kbd "M-s")               "exec stacer"
  (kbd "u")                 "intel-unite"
  (kbd "v")                 "gvim"
  (kbd "C-v")               "exec gvim"
  (kbd "M-v")               (urxvt-command "vim")
  (kbd "w")                 "wireshark"
  (kbd "z")                 "mobl-raise"
  (kbd "C-z")               "mobl-run"
  ))

;; *zz-x-map*
(apply-keys-to-map
 *zz-x-map*
 (list
  (kbd "1")                 "only"
  (kbd "2")                 "vsplit"
  (kbd "3")                 "hsplit"
  (kbd "4")                 "kill"
  (kbd "0")                 "remove"

  (kbd "c")                 "fclear"
  (kbd "d")                 "delete"
  (kbd "i")                 "window-info"
  (kbd "k")                 "kill"
  (kbd "C-k")               "kill-from-windowlist"
  (kbd "m")                 "fselect"
  (kbd "o")                 "fother"
  (kbd "q")                 "system-action"
  (kbd "s")                 "swap-windows"
  (kbd "r")                 "restore-group-file"
  (kbd "C-r")               "dump-group-file"
  ))

;; *zz-help-map*
(apply-keys-to-map
 *zz-help-map*
 (list
  (kbd "c")                 "describe-command"
  (kbd "f")                 "describe-function"
  (kbd "k")                 "describe-key"
  (kbd "m")                 "stumpwm-manual"
  (kbd "v")                 "describe-variable"
  (kbd "w")                 "where-is"

  (kbd "M-c")               "commands"
  (kbd "M-m")               "manpage"
  (kbd "M-v")               "version"
  ))

;; input map
(apply-keys-to-map
 *input-map*
 (list
  (kbd "C-m")               'stumpwm::input-submit
  (kbd "C-h")               'stumpwm::input-delete-backward-char
  (kbd "M-n")               'stumpwm::input-history-forward
  (kbd "M-p")               'stumpwm::input-history-back
  (kbd "C-i")               'stumpwm::input-complete-forward
  ))

;; menu map
(apply-keys-to-map
 stumpwm::*menu-map*
 (list
  (kbd "C-m")               'stumpwm::menu-finish
  (kbd "C-h")               'stumpwm::menu-backspace
  (kbd "M-n")               'stumpwm::menu-scroll-down
  (kbd "M-p")               'stumpwm::menu-scroll-up
  (kbd "Tab")               'stumpwm::menu-down
  (kbd "ISO_Left_Tab")      'stumpwm::menu-up
  ))

;; top map
(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-`")               "windowlist"
  (kbd "s-M-`")             "grouplist"
  (kbd "s-C-`")             "skippy"
  (kbd "s-'")               "windowlist"
  (kbd "s-M-'")             "grouplist"
  (kbd "s-C-'")             "skippy"

  (kbd "s-Escape")          "abort"
  (kbd "s-M-Escape")        "banish"

  ;; PSc/SRq
  (kbd "SunPrint_Screen")   "scrot-full"
  (kbd "M-SunPrint_Screen") "scrot-window"
  (kbd "C-SunPrint_Screen") "scrot-select"

  (kbd "s-Tab")             "pull-hidden-next"
  (kbd "s-M-Tab")           "gnext"
  (kbd "s-BackSpace")       "pull-hidden-next"
  (kbd "s-M-BackSpace")     "gnext"

  (kbd "s-Left")            "move-focus left"
  (kbd "s-Right")           "move-focus right"
  (kbd "s-Up")              "move-focus up"
  (kbd "s-Down")            "move-focus down"

  (kbd "s-M-Left")          "move-window left"
  (kbd "s-M-Right")         "move-window right"
  (kbd "s-M-Up")            "move-window up"
  (kbd "s-M-Down")          "move-window down"

  (kbd "s-C-Left")          "exchange-direction left"
  (kbd "s-C-Right")         "exchange-direction right"
  (kbd "s-C-Up")            "exchange-direction up"
  (kbd "s-C-Down")          "exchange-direction down"

  (kbd "s-M-r")             "exec rofi -show run"
  (kbd "s-M-s")             "exec rofi -show ssh"
  (kbd "s-M-w")             "exec rofi -show window"
  (kbd "s-M-d")             "exec rofi -show drun"
  (kbd "s-M-?")             "exec rofi -show keys"

  (kbd "s-C-b")             "mode-line"
  (kbd "s-C-d")             "safe-delete"
  (kbd "s-C-g")             "refresh"
  (kbd "s-C-q")             "kill-stumpwm"
  (kbd "s-C-r")             "reinit"

  (kbd "s-[")               "prev-in-frame"
  (kbd "s-]")               "next-in-frame"
  (kbd "s-M-[")             "gprev"
  (kbd "s-M-]")             "gnext"

  (kbd "s-\\")              "iresize"
  (kbd "s-M-\\")            "balance-frames"

  (kbd "s-,")               "pactl-down"
  (kbd "s-.")               "pactl-up"
  (kbd "s-M-,")             "pactl-mic-down"
  (kbd "s-M-.")             "pactl-mic-up"
  (kbd "s-m")               "pactl-toggle"
  (kbd "s-M-m")             "pactl-mic-toggle"

  (kbd "s-a")               "app-menu"
  (kbd "s-o")               "pull-hidden-other"
  (kbd "s-M-o")             "gother"

  (kbd "s-M-e")             "runemacs"
  (kbd "s-M-g")             "google-chrome"
  ))

(apply-keys-to-map
 *root-map*
 (list
  (kbd "c")                 "urxvt"
  (kbd "C-c")               "exec urxvt"
  ))

(apply-keys-to-map
 *zz-screen-map*
 (list
  (kbd "1")                 "pactl-toggle"
  (kbd "2")                 "pactl-down"
  (kbd "3")                 "pactl-up"
  (kbd "4")                 "pactl-mic-toggle"
  (kbd "6")                 "touchpad-toggle"
  (kbd "7")                 "wifi-toggle"
  (kbd "8")                 "cheese"
  (kbd "0")                 "screen-menu"
  (kbd "-")                 "bright-down"
  (kbd "=")                 "bright-up"

  (kbd "d")                 "toggle-root"
  (kbd "f")                 "fullscreen"
  (kbd "g")                 "refresh"

  (kbd "k")                 "sprev"
  (kbd "j")                 "snext"
  (kbd "o")                 "sother"

  (kbd "l")                 "exec slock"
  (kbd "M-l")               "exec xtrlock"
  (kbd "t")                 "exec transset"

  (kbd "r")                 "resolution"
  (kbd "b")                 "show-battery"

  (kbd "p")                 "scrot-full"
  (kbd "M-p")               "scrot-window"
  (kbd "C-p")               "scrot-select"
  ))

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-h")               (getkey-top (kbd "s-Left"))
  (kbd "s-l")               (getkey-top (kbd "s-Right"))
  (kbd "s-k")               (getkey-top (kbd "s-Up"))
  (kbd "s-j")               (getkey-top (kbd "s-Down"))

  (kbd "s-M-h")             (getkey-top (kbd "s-M-Left"))
  (kbd "s-M-l")             (getkey-top (kbd "s-M-Right"))
  (kbd "s-M-k")             (getkey-top (kbd "s-M-Up"))
  (kbd "s-M-j")             (getkey-top (kbd "s-M-Down"))

  (kbd "s-C-h")             (getkey-top (kbd "s-C-Left"))
  (kbd "s-C-l")             (getkey-top (kbd "s-C-Right"))
  (kbd "s-C-k")             (getkey-top (kbd "s-C-Up"))
  (kbd "s-C-j")             (getkey-top (kbd "s-C-Down"))
  ))

(apply-keys-to-map
 *zz-c-map*
 (list
  (kbd "1")                 (rat-click 1)   ;;left
  (kbd "2")                 (rat-click 2)   ;;middle
  (kbd "3")                 (rat-click 3)   ;;right
  (kbd "4")                 (rat-click 4)   ;;wheel up
  (kbd "5")                 (rat-click 5)   ;;whell down

  (kbd "b")                 (getkey-top (kbd "s-Left"))
  (kbd "f")                 (getkey-top (kbd "s-Right"))
  (kbd "p")                 (getkey-top (kbd "s-Up"))
  (kbd "n")                 (getkey-top (kbd "s-Down"))

  (kbd "M-b")               (getkey-top (kbd "s-M-Left"))
  (kbd "M-f")               (getkey-top (kbd "s-M-Right"))
  (kbd "M-p")               (getkey-top (kbd "s-M-Up"))
  (kbd "M-n")               (getkey-top (kbd "s-M-Down"))

  (kbd "C-b")               (getkey-top (kbd "s-C-Left"))
  (kbd "C-f")               (getkey-top (kbd "s-C-Right"))
  (kbd "C-p")               (getkey-top (kbd "s-C-Up"))
  (kbd "C-n")               (getkey-top (kbd "s-C-Down"))

  ;;b/f, p/n for arrow control
  (kbd "Tab")               "capslock-toggle"
  (kbd "a")                 "pavucontrol"
  (kbd "h")                 "process-menu"
  (kbd "k")                 "keymap-menu"
  (kbd "l")                 "locate-menu"
  (kbd "p")                 "screen-menu"
  (kbd "s")                 "search-menu"
  (kbd "t")                 "tmux-menu"
  (kbd "w")                 "wifi-menu"
  ))

(apply-keys-to-map
 *resize-map*
 (list
  (kbd "C-m")               "exit-iresize"
  ))
