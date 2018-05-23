;;;; F1 - F12 setting -*-lisp-*-
;;

(in-package :stumpwm)

;; top map
(apply-keys-to-map
 *top-map*
 (list
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
  (kbd "s-F10")     "colon"
  (kbd "s-C-F10")   "eval"
  (kbd "s-F11")     "fullscreen"
  (kbd "s-C-F11")   "echo-date"
  (kbd "s-F12")     "abort"
  (kbd "s-C-F12")   "banish"
  ))

;; zz-z-map
(apply-keys-to-map
 *zz-z-map*
 (list
  (kbd "1")         (lookup-key *top-map* (kbd "s-F1"))
  (kbd "C-1")       (lookup-key *top-map* (kbd "s-C-F1"))
  (kbd "2")         (lookup-key *top-map* (kbd "s-F2"))
  (kbd "C-2")       (lookup-key *top-map* (kbd "s-C-F2"))
  (kbd "3")         (lookup-key *top-map* (kbd "s-F3"))
  (kbd "C-3")       (lookup-key *top-map* (kbd "s-C-F3"))
  (kbd "4")         (lookup-key *top-map* (kbd "s-F4"))
  (kbd "C-4")       (lookup-key *top-map* (kbd "s-C-F4"))

  (kbd "5")         (lookup-key *top-map* (kbd "s-F5"))
  (kbd "C-5")       (lookup-key *top-map* (kbd "s-C-F5"))
  (kbd "6")         (lookup-key *top-map* (kbd "s-F6"))
  (kbd "C-6")       (lookup-key *top-map* (kbd "s-C-F6"))
  (kbd "7")         (lookup-key *top-map* (kbd "s-F7"))
  (kbd "C-7")       (lookup-key *top-map* (kbd "s-C-F7"))
  (kbd "8")         (lookup-key *top-map* (kbd "s-F8"))
  (kbd "C-8")       (lookup-key *top-map* (kbd "s-C-F8"))

  (kbd "9")         (lookup-key *top-map* (kbd "s-F9"))
  (kbd "C-9")       (lookup-key *top-map* (kbd "s-C-F9"))
  (kbd "0")         (lookup-key *top-map* (kbd "s-F10"))
  (kbd "C-0")       (lookup-key *top-map* (kbd "s-C-F10"))
  (kbd "-")         (lookup-key *top-map* (kbd "s-F11"))
  (kbd "C--")       (lookup-key *top-map* (kbd "s-C-F11"))
  (kbd "=")         (lookup-key *top-map* (kbd "s-F12"))
  (kbd "C-=")       (lookup-key *top-map* (kbd "s-C-F12"))
  ))
