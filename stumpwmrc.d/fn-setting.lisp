;;;; F1 - F12 setting -*-lisp-*-
;;

(in-package :stumpwm)

;; top map
(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-F1")      "gprint"
  (kbd "s-C-F1")    "gmove"
  (kbd "s-F2")      "exec dmenu_run -fn consola-15"
  (kbd "s-C-F2")    "exec"
  (kbd "s-F3")      "pull-hidden-other"
  (kbd "s-C-F3")    "gother"
  (kbd "s-F4")      "kill"
  (kbd "s-C-F4")    "gkill"

  ;; Floating Group Basics
  ;; Left click/drag=>move, Right click/drag=>resize
  (kbd "s-F5")      "gnew f5"
  (kbd "s-C-F5")    "gnew-float f5-float"
  (kbd "s-F6")      "gnew f6"
  (kbd "s-C-F6")    "gnew-float f6-float"
  (kbd "s-F7")      "gnew f7"
  (kbd "s-C-F7")    "gnew-float f7-float"
  (kbd "s-F8")      "gnew f8"
  (kbd "s-C-F8")    "gnew-float f8-float"

  (kbd "s-F9")      "gselect Default"
  (kbd "s-C-F9")    "gselect"
  (kbd "s-F10")     "colon"
  (kbd "s-C-F10")   "eval"
  (kbd "s-F11")     "gnew"
  (kbd "s-C-F11")   "gnew-float"
  (kbd "s-F12")     "lastmsg"
  (kbd "s-C-F12")   "echo-date"
  ))

;; zz-f-map
(apply-keys-to-map
 *zz-f-map*
 (list
  (kbd "1")         (getkey-top (kbd "s-F1"))
  (kbd "2")         (getkey-top (kbd "s-F2"))
  (kbd "3")         (getkey-top (kbd "s-F3"))
  (kbd "4")         (getkey-top (kbd "s-F4"))
  (kbd "5")         (getkey-top (kbd "s-F5"))
  (kbd "6")         (getkey-top (kbd "s-F6"))
  (kbd "7")         (getkey-top (kbd "s-F7"))
  (kbd "8")         (getkey-top (kbd "s-F8"))
  (kbd "9")         (getkey-top (kbd "s-F9"))
  (kbd "0")         (getkey-top (kbd "s-F10"))
  (kbd "-")         (getkey-top (kbd "s-F11"))
  (kbd "=")         (getkey-top (kbd "s-F12"))

  (kbd "C-1")       (getkey-top (kbd "s-C-F1"))
  (kbd "C-2")       (getkey-top (kbd "s-C-F2"))
  (kbd "C-3")       (getkey-top (kbd "s-C-F3"))
  (kbd "C-4")       (getkey-top (kbd "s-C-F4"))
  (kbd "C-5")       (getkey-top (kbd "s-C-F5"))
  (kbd "C-6")       (getkey-top (kbd "s-C-F6"))
  (kbd "C-7")       (getkey-top (kbd "s-C-F7"))
  (kbd "C-8")       (getkey-top (kbd "s-C-F8"))
  (kbd "C-9")       (getkey-top (kbd "s-C-F9"))
  (kbd "C-0")       (getkey-top (kbd "s-C-F10"))
  (kbd "C--")       (getkey-top (kbd "s-C-F11"))
  (kbd "C-=")       (getkey-top (kbd "s-C-F12"))

  (kbd "M-1")       (getkey-top (kbd "s-M-F1"))
  (kbd "M-2")       (getkey-top (kbd "s-M-F2"))
  (kbd "M-3")       (getkey-top (kbd "s-M-F3"))
  (kbd "M-4")       (getkey-top (kbd "s-M-F4"))
  (kbd "M-5")       (getkey-top (kbd "s-M-F5"))
  (kbd "M-6")       (getkey-top (kbd "s-M-F6"))
  (kbd "M-7")       (getkey-top (kbd "s-M-F7"))
  (kbd "M-8")       (getkey-top (kbd "s-M-F8"))
  (kbd "M-9")       (getkey-top (kbd "s-M-F9"))
  (kbd "M-10")      (getkey-top (kbd "s-M-F10"))
  (kbd "M-11")      (getkey-top (kbd "s-M-F11"))
  (kbd "M-12")      (getkey-top (kbd "s-M-F12"))
  ))
