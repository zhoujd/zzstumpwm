;;;; F1 - F12 setting -*-lisp-*-
;;

(in-package :stumpwm)

;; top map
(zz/apply-keys-to-map
 *top-map*
 (list
  (kbd "s-F1")      "zz/gprint"
  (kbd "s-M-F1")    "gmove"
  (kbd "s-F2")      "exec dmenu_run -fn consola-15"
  (kbd "s-M-F2")    "exec"
  (kbd "s-F3")      "pull-hidden-other"
  (kbd "s-M-F3")    "gother"
  (kbd "s-F4")      "zz/safe-kill"
  (kbd "s-M-F4")    "zz/safe-gkill"

  ;; Floating Group Basics
  ;; Left click/drag=>move, Right click/drag=>resize
  (kbd "s-F5")      "gnew f5"
  (kbd "s-M-F5")    "gnew-float f5-float"
  (kbd "s-F6")      "gnew f6"
  (kbd "s-M-F6")    "gnew-float f6-float"
  (kbd "s-F7")      "gnew f7"
  (kbd "s-M-F7")    "gnew-float f7-float"
  (kbd "s-F8")      "gnew f8"
  (kbd "s-M-F8")    "gnew-float f8-float"

  (kbd "s-F9")      "gnew Default"
  (kbd "s-M-F9")    "gselect"
  (kbd "s-F10")     "colon"
  (kbd "s-M-F10")   "eval"
  (kbd "s-F11")     "gnew"
  (kbd "s-M-F11")   "gnew-float"
  (kbd "s-F12")     "lastmsg"
  (kbd "s-M-F12")   "echo-date"
  ))

(zz/apply-keys-to-map
 *top-map*
 (list
  (kbd "s-1")       (zz/getkey-top (kbd "s-F1"))
  (kbd "s-2")       (zz/getkey-top (kbd "s-F2"))
  (kbd "s-3")       (zz/getkey-top (kbd "s-F3"))
  (kbd "s-4")       (zz/getkey-top (kbd "s-F4"))
  (kbd "s-5")       (zz/getkey-top (kbd "s-F5"))
  (kbd "s-6")       (zz/getkey-top (kbd "s-F6"))
  (kbd "s-7")       (zz/getkey-top (kbd "s-F7"))
  (kbd "s-8")       (zz/getkey-top (kbd "s-F8"))
  (kbd "s-9")       (zz/getkey-top (kbd "s-F9"))
  (kbd "s-0")       (zz/getkey-top (kbd "s-F10"))
  (kbd "s--")       (zz/getkey-top (kbd "s-F11"))
  (kbd "s-=")       (zz/getkey-top (kbd "s-F12"))

  (kbd "s-M-1")     (zz/getkey-top (kbd "s-M-F1"))
  (kbd "s-M-2")     (zz/getkey-top (kbd "s-M-F2"))
  (kbd "s-M-3")     (zz/getkey-top (kbd "s-M-F3"))
  (kbd "s-M-4")     (zz/getkey-top (kbd "s-M-F4"))
  (kbd "s-M-5")     (zz/getkey-top (kbd "s-M-F5"))
  (kbd "s-M-6")     (zz/getkey-top (kbd "s-M-F6"))
  (kbd "s-M-7")     (zz/getkey-top (kbd "s-M-F7"))
  (kbd "s-M-8")     (zz/getkey-top (kbd "s-M-F8"))
  (kbd "s-M-9")     (zz/getkey-top (kbd "s-M-F9"))
  (kbd "s-M-0")     (zz/getkey-top (kbd "s-M-F10"))
  (kbd "s-M--")     (zz/getkey-top (kbd "s-M-F11"))
  (kbd "s-M-=")     (zz/getkey-top (kbd "s-M-F12"))
  ))

(zz/apply-keys-to-map
 *top-map*
 (list
  (kbd "XF86AudioLowerVolume")   "amixer-Master-1-"
  (kbd "XF86AudioRaiseVolume")   "amixer-Master-1+"
  (kbd "XF86AudioMute")          "amixer-Master-toggle pulse"
  (kbd "XF86AudioMicMute")       "zz/amixer-mic-toggle"
  (kbd "XF86MonBrightnessDown")  "zz/bright-down"
  (kbd "XF86MonBrightnessUp")    "zz/bright-up"
  ))
