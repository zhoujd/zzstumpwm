;;;; akey setting -*-lisp-*-
;;

(in-package :zwm)

;; top map
(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-Left")            "move-focus-left"
  (kbd "s-Right")           "move-focus-right"
  (kbd "s-Up")              "move-focus-up"
  (kbd "s-Down")            "move-focus-down"

  (kbd "s-M-Left")          "move-window-left"
  (kbd "s-M-Right")         "move-window-right"
  (kbd "s-M-Up")            "move-window-up"
  (kbd "s-M-Down")          "move-window-down"

  (kbd "s-C-Left")          "exchange-left"
  (kbd "s-C-Right")         "exchange-right"
  (kbd "s-C-Up")            "exchange-up"
  (kbd "s-C-Down")          "exchange-down"

  (kbd "s-S-Left")          "resize-direction left"
  (kbd "s-S-Right")         "resize-direction right"
  (kbd "s-S-Up")            "resize-direction up"
  (kbd "s-S-Down")          "resize-direction down"
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

  (kbd "s-H")               (getkey-top (kbd "s-S-Left"))
  (kbd "s-L")               (getkey-top (kbd "s-S-Right"))
  (kbd "s-K")               (getkey-top (kbd "s-S-Up"))
  (kbd "s-J")               (getkey-top (kbd "s-S-Down"))
  ))

(apply-keys-to-map
 *zz-c-map*
 (list
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

  (kbd "H")                 (getkey-top (kbd "s-S-Left"))
  (kbd "L")                 (getkey-top (kbd "s-S-Right"))
  (kbd "K")                 (getkey-top (kbd "s-S-Up"))
  (kbd "J")                 (getkey-top (kbd "s-S-Down"))
  ))
