;;;; F1 - F12 setting -*-lisp-*-
;;

(in-package :zz)

;; top map
(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-F1")      "gprint"
  (kbd "s-M-F1")    "gmove"
  (kbd "s-F2")      "exec dmenu_run -fn consola-15"
  (kbd "s-M-F2")    "exec"
  (kbd "s-F3")      "pull-hidden-other"
  (kbd "s-M-F3")    "gother"
  (kbd "s-F4")      "safe-kill"
  (kbd "s-M-F4")    "safe-gkill"

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

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-1")       (getkey-top (kbd "s-F1"))
  (kbd "s-2")       (getkey-top (kbd "s-F2"))
  (kbd "s-3")       (getkey-top (kbd "s-F3"))
  (kbd "s-4")       (getkey-top (kbd "s-F4"))
  (kbd "s-5")       (getkey-top (kbd "s-F5"))
  (kbd "s-6")       (getkey-top (kbd "s-F6"))
  (kbd "s-7")       (getkey-top (kbd "s-F7"))
  (kbd "s-8")       (getkey-top (kbd "s-F8"))
  (kbd "s-9")       (getkey-top (kbd "s-F9"))
  (kbd "s-0")       (getkey-top (kbd "s-F10"))
  (kbd "s--")       (getkey-top (kbd "s-F11"))
  (kbd "s-=")       (getkey-top (kbd "s-F12"))

  (kbd "s-M-1")     (getkey-top (kbd "s-M-F1"))
  (kbd "s-M-2")     (getkey-top (kbd "s-M-F2"))
  (kbd "s-M-3")     (getkey-top (kbd "s-M-F3"))
  (kbd "s-M-4")     (getkey-top (kbd "s-M-F4"))
  (kbd "s-M-5")     (getkey-top (kbd "s-M-F5"))
  (kbd "s-M-6")     (getkey-top (kbd "s-M-F6"))
  (kbd "s-M-7")     (getkey-top (kbd "s-M-F7"))
  (kbd "s-M-8")     (getkey-top (kbd "s-M-F8"))
  (kbd "s-M-9")     (getkey-top (kbd "s-M-F9"))
  (kbd "s-M-0")     (getkey-top (kbd "s-M-F10"))
  (kbd "s-M--")     (getkey-top (kbd "s-M-F11"))
  (kbd "s-M-=")     (getkey-top (kbd "s-M-F12"))
  ))

(apply-keys-to-map
 *top-map*
 (list
  (kbd "XF86AudioLowerVolume")   "pactl-down"
  (kbd "XF86AudioRaiseVolume")   "pactl-up"
  (kbd "XF86AudioMute")          "pactl-toggle"
  (kbd "XF86AudioMicMute")       "pactl-mic-toggle"
  (kbd "XF86MonBrightnessDown")  "bright-down"
  (kbd "XF86MonBrightnessUp")    "bright-up"
  ))
