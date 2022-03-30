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
  (kbd "c")                 "runurxvt"
  (kbd "C")                 "pullurxvt"
  (kbd "C-c")               "exec urxvt"
  (kbd "M-c")               "urxvtclient"
  (kbd "s-c")               "urxvt"
  (kbd "d")                 "deadbeef"
  (kbd "C-d")               "meld"
  (kbd "M-d")               "drawio"
  (kbd "e")                 "runemacs"
  (kbd "E")                 "pullemacs"
  (kbd "C-e")               "exec emacs"
  (kbd "M-e")               "emacsclient"
  (kbd "s-e")               "emacs"
  (kbd "f")                 "firefox"
  (kbd "C-f")               "exec firefox"
  (kbd "M-f")               "colon1 exec firefox http://"
  (kbd "g")                 "rungc"
  (kbd "G")                 "pullgc"
  (kbd "M-g")               "colon1 exec google-chrome http://"
  (kbd "s-g")               "google-chrome"
  (kbd "h")                 "thunar"
  (kbd "C-h")               "exec thunar"
  (kbd "M-h")               "exec thunar -B"
  (kbd "i")                 "iptux"
  (kbd "k")                 (urxvt-command "gtypist")
  (kbd "C-k")               "klavaro"
  (kbd "l")                 "libreoffice"
  (kbd "C-l")               "exec libreoffice"
  (kbd "m")                 "evolution"
  (kbd "C-m")               "claws-mail"
  (kbd "n")                 "cherrytree"
  (kbd "C-n")               "exec cherrytree"
  (kbd "o")                 "ocenaudio"
  (kbd "C-o")               "exec ocenaudio"
  (kbd "M-o")               "openshot"
  (kbd "p")                 (urxvt-command "bpython")
  (kbd "C-p")               "pavucontrol"
  (kbd "M-p")               "exec p4merge"
  (kbd "q")                 "slingscold"
  (kbd "C-q")               "exec slingscold"
  (kbd "r")                 "ranger"
  (kbd "C-r")               (urxvt-command "ranger")
  (kbd "M-r")               "exec remmina"
  (kbd "t")                 "teams"
  (kbd "C-t")               (urxvt-command "tmux")
  (kbd "M-t")               "tmux"
  (kbd "s-t")               "teams-force"
  (kbd "s")                 (urxvt-command "speedpad")
  (kbd "C-s")               "stumpish"
  (kbd "M-s")               "exec stacer"
  (kbd "u")                 "intel-unite"
  (kbd "v")                 "gvim"
  (kbd "C-v")               "exec gvim"
  (kbd "M-v")               (urxvt-command "vim")
  (kbd "w")                 "wireshark"
  (kbd "z")                 "jiandon-mobl"
  (kbd "C-z")               "exec jiandon-mobl"
  ))

;; *zz-x-map*
(apply-keys-to-map
 *zz-x-map*
 (list
  (kbd "c")                 "fclear"
  (kbd "d")                 "delete"
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
  (kbd "M-SunPrint_Screen") "scrot-window"
  (kbd "C-SunPrint_Screen") "scrot-select"

  (kbd "s-Tab")             "pull-window-next"
  (kbd "s-M-Tab")           "gnext"
  (kbd "s-BackSpace")       "pull-window-prev"
  (kbd "s-M-BackSpace")     "gprev"

  (kbd "s-M-w")             "exec rofi -show window"
  (kbd "s-M-r")             "exec rofi -show run"
  (kbd "s-M-s")             "exec rofi -show ssh"
  (kbd "s-M-d")             "exec rofi -show drun"
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
  (kbd "s-p")               "screen-menu"
  (kbd "s-o")               "window-other"
  (kbd "s-M-o")             "gother"
  (kbd "s-q")               "safe-kill"
  (kbd "s-M-q")             "group-kill"

  (kbd "s-C")               "urxvt"
  (kbd "s-E")               "emacs"
  (kbd "s-G")               "google-chrome"

  (kbd "s-M-c")             "runurxvt"
  (kbd "s-M-e")             "runemacs"
  (kbd "s-M-g")             "rungc"
  (kbd "s-M-m")             "evolution"
  (kbd "s-M-t")             "teams"
  (kbd "s-M-z")             "jiandon-mobl"
  ))

(apply-keys-to-map
 *root-map*
 (list
  (kbd "c")                 "urxvt"
  (kbd "C-c")               "urxvt"
  ))

(apply-keys-to-map
 *zz-screen-map*
 (list
  (kbd "d")                 "group-desktop"
  (kbd "f")                 "group-fullscreen"
  (kbd "g")                 "group-fresh"

  (kbd "k")                 "sprev"
  (kbd "j")                 "snext"
  (kbd "o")                 "sother"

  (kbd "l")                 "exec slock"
  (kbd "C-l")               "exec zlock"
  (kbd "M-l")               "exec xtrlock"
  (kbd "t")                 "exec transset"

  (kbd "r")                 "record-toggle"
  (kbd "C-r")               "record-start"
  (kbd "M-r")               "record-stop"
  (kbd "s-r")               "record-play"
  (kbd "b")                 "show-battery"

  (kbd "p")                 "scrot-full"
  (kbd "C-p")               "scrot-select"
  (kbd "M-p")               "scrot-window"
  ))

(apply-keys-to-map
 *zz-c-map*
 (list
  ;;b/f, p/n for arrow control
  (kbd "Tab")               "capslock-toggle"
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
  (kbd "d")                 "exec rofi -show drun"
  (kbd "C-d")               "exec rofi -show drun"
  (kbd "v")                 "exec rofi -show windowcd"
  (kbd "C-v")               "exec rofi -show windowcd"
  (kbd "C-?")               "exec rofi -show keys"
  ))
