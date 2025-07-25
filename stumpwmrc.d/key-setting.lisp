;;;; key setting -*-lisp-*-
;;

(in-package :zwm)

;; *zz-exec-map*
(apply-keys-to-map
 *zz-exec-map*
 (list
  (kbd "a")                 "audacity"
  (kbd "C-a")               "exec audacity"
  (kbd "b")                 "google"
  (kbd "C-b")               "bing"
  (kbd "M-b")               "wikipedia"
  (kbd "B")                 "bcompare"
  (kbd "C-B")               "exec bcompare"
  (kbd "c")                 "runst"
  (kbd "C")                 "pullst"
  (kbd "C-c")               "exec st"
  (kbd "s-c")               "st"
  (kbd "d")                 "deadbeef"
  (kbd "C-d")               "meld"
  (kbd "M-d")               "drawio"
  (kbd "e")                 "runemacs"
  (kbd "E")                 "pullemacs"
  (kbd "C-e")               "exec emacs"
  (kbd "M-e")               "emacsclient"
  (kbd "s-e")               "emacs"
  (kbd "f")                 "firefox"
  (kbd "M-f")               "exec firefox"
  (kbd "g")                 "rungc"
  (kbd "G")                 "pullgc"
  (kbd "M-g")               "exec google-chrome"
  (kbd "s-g")               "google-chrome"
  (kbd "h")                 "pcmanfm"
  (kbd "C-h")               "exec pcmanfm"
  (kbd "i")                 "iptux"
  (kbd "k")                 (st-command "gtypist")
  (kbd "C-k")               "klavaro"
  (kbd "l")                 "libreoffice"
  (kbd "C-l")               "exec libreoffice"
  (kbd "m")                 "evolution"
  (kbd "C-m")               "claws-mail"
  (kbd "M-m")               "outlook"
  (kbd "s-m")               "evolution-force"
  (kbd "n")                 "nnn"
  (kbd "C-n")               (st-command "nnn")
  (kbd "o")                 "onlyoffice"
  (kbd "C-o")               "ocenaudio"
  (kbd "M-o")               "openshot"
  (kbd "p")                 (st-command "bpython")
  (kbd "C-p")               "pavucontrol"
  (kbd "M-p")               "exec p4merge"
  (kbd "q")                 "slingscold"
  (kbd "C-q")               "exec slingscold"
  (kbd "r")                 "remmina"
  (kbd "C-r")               "exec remmina"
  (kbd "t")                 "teams"
  (kbd "C-t")               (st-command "tmux")
  (kbd "M-t")               "tmux"
  (kbd "s-t")               "teams-force"
  (kbd "s")                 "ssh"
  (kbd "C-s")               (st-command "screen")
  (kbd "M-s")               "screen"
  (kbd "s-s")               "exec stacer"
  (kbd "u")                 "code"
  (kbd "C-u")               "exec code"
  (kbd "v")                 "gvim"
  (kbd "C-v")               "exec gvim"
  (kbd "M-v")               (st-command "vim")
  (kbd "w")                 "wireshark"
  (kbd "x")                 "runurxvt"
  (kbd "X")                 "pullurxvt"
  (kbd "C-x")               "exec urxvt"
  (kbd "M-x")               "urxvtclient"
  (kbd "s-x")               "urxvt"
  (kbd "z")                 "slock"
  ))

;; *zz-x-map*
(apply-keys-to-map
 *zz-x-map*
 (list
  (kbd "c")                 "fclear"
  (kbd "d")                 "delete"
  (kbd "f")                 "pull-group-windows"
  (kbd "g")                 "refresh"
  (kbd "i")                 "window-info"
  (kbd "k")                 "kill-from-windowlist"
  (kbd "l")                 "list-window-properties"
  (kbd "m")                 "fselect"
  (kbd "o")                 "fother"
  (kbd "p")                 "pull-from-windowlist"
  (kbd "q")                 "system-action"
  (kbd "r")                 "remove"
  (kbd "s")                 "swap-windows"
  (kbd "x")                 "kill-from-all-windows"
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
  (kbd "s-C-;")             "slock"

  (kbd "s-Escape")          "abort"
  (kbd "s-M-Escape")        "banish"

  ;; PSc/SRq
  (kbd "SunPrint_Screen")   "scrot-full"
  (kbd "C-SunPrint_Screen") "scrot-select"
  (kbd "M-SunPrint_Screen") "scrot-window"

  (kbd "s-Tab")             "pull-window-next"
  (kbd "s-M-Tab")           "gnext"
  (kbd "s-BackSpace")       "pull-window-prev"
  (kbd "s-M-BackSpace")     "gprev"

  (kbd "s-M-w")             "exec rofi -show window"
  (kbd "s-M-r")             "exec rofi -show run"
  (kbd "s-M-s")             "exec rofi -show ssh"
  (kbd "s-M-p")             "exec rofi -show drun"
  (kbd "s-M-v")             "exec rofi -show windowcd"
  (kbd "s-M-?")             "exec rofi -show keys"

  (kbd "s-C-b")             "mode-line"
  (kbd "s-C-d")             "safe-delete"
  (kbd "s-C-g")             "refresh"
  (kbd "s-C-q")             "kill-stumpwm"
  (kbd "s-C-r")             "reinit"

  (kbd "s-[")               "window-previous"
  (kbd "s-]")               "window-next"
  (kbd "s-M-[")             "gprev"
  (kbd "s-M-]")             "gnext"

  (kbd "s-\\")              "iresize"
  (kbd "s-M-\\")            "balance-frames"

  (kbd "s-,")               "pactl-down"
  (kbd "s-.")               "pactl-up"
  (kbd "s-M-,")             "pactl-mic-down"
  (kbd "s-M-.")             "pactl-mic-up"
  (kbd "s-/")               "pactl-toggle"
  (kbd "s-M-/")             "pactl-mic-toggle"

  (kbd "s-a")               "app-menu"
  (kbd "s-d")               "screen-menu"
  (kbd "s-o")               "window-other"
  (kbd "s-M-o")             "gother"
  (kbd "s-q")               "window-kill"
  (kbd "s-M-q")             "group-kill"

  (kbd "s-C")               "st"
  (kbd "s-E")               "emacsclient"
  (kbd "s-G")               "google-chrome"

  (kbd "s-M-c")             "runst"
  (kbd "s-M-e")             "runemacs"
  (kbd "s-M-g")             "rungc"
  (kbd "s-M-m")             "evolution"
  (kbd "s-M-n")             "nnn"
  (kbd "s-M-t")             "teams"
  (kbd "s-M-u")             "code"
  (kbd "s-M-x")             "urxvt"
  (kbd "s-M-z")             "slock"
  ))

(apply-keys-to-map
 *root-map*
 (list
  (kbd "c")                 "st"
  (kbd "C-c")               "st"
  ))

(apply-keys-to-map
 *zz-screen-map*
 (list
  (kbd "b")                 "show-battery"
  (kbd "t")                 "transset"

  (kbd "d")                 "group-desktop"
  (kbd "f")                 "group-fullscreen"
  (kbd "g")                 "group-fresh"

  (kbd "k")                 "sprev"
  (kbd "j")                 "snext"
  (kbd "o")                 "sother"

  (kbd "l")                 "slock"

  (kbd "r")                 "record-toggle"
  (kbd "C-r")               "record-full"
  (kbd "M-r")               "record-stop"
  (kbd "s-r")               "record-play"

  (kbd "p")                 "scrot-full"
  (kbd "C-p")               "scrot-select"
  (kbd "M-p")               "scrot-window"

  (kbd "c")                 "clipboard-full"
  (kbd "C-c")               "clipboard-select"
  (kbd "M-c")               "clipboard-window"
  ))

(apply-keys-to-map
 *zz-c-map*
 (list
  ;;b/f, p/n for arrow control
  (kbd "Tab")               "capslock-toggle"
  (kbd "BackSpace")         "swank-toggle"
  (kbd "a")                 "pavucontrol"
  (kbd "c")                 "cheese"
  (kbd "h")                 "htop"
  (kbd "k")                 "keymap-menu"
  (kbd "l")                 "locate-menu"
  (kbd "o")                 "audio-menu"
  (kbd "r")                 "screen-menu"
  (kbd "s")                 "search-menu"
  (kbd "t")                 "tmux-menu"
  (kbd "v")                 "vpn-menu"
  (kbd "w")                 "wifi-menu"
  (kbd "x")                 "vbox-menu"
  ))

(apply-keys-to-map
 *zz-menu-map*
 (list
  (kbd "a")                 "app-menu"
  (kbd "C-a")               "app-menu"
  (kbd "w")                 "exec rofi -show window"
  (kbd "C-w")               "exec rofi -show window"
  (kbd "r")                 "exec rofi -show run"
  (kbd "C-r")               "exec rofi -show run"
  (kbd "s")                 "exec rofi -show ssh"
  (kbd "C-s")               "exec rofi -show ssh"
  (kbd "p")                 "exec rofi -show drun"
  (kbd "C-p")               "exec rofi -show drun"
  (kbd "v")                 "exec rofi -show windowcd"
  (kbd "C-v")               "exec rofi -show windowcd"
  (kbd "C-?")               "exec rofi -show keys"
  ))
