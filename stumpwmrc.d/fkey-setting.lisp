;;;; F1 - F12 setting -*-lisp-*-
;;

(in-package :zwm)

(defvar fkeys-alist
  '(("F1"  . "XF86AudioMute")
    ("F2"  . "XF86AudioLowerVolume")
    ("F3"  . "XF86AudioRaiseVolume")
    ("F4"  . "XF86AudioMicMute")
    ("F6"  . "XF86TouchpadOn")
    ("F6"  . "XF86TouchpadOff")
    ("F7"  . "XF86RFKill")
    ("F8"  . "XF86WebCam")
    ("F11" . "XF86MonBrightnessDown")
    ("F12" . "XF86MonBrightnessUp"))
  "Alist of functional and additional keys")

(apply-keys-to-map
 *top-map*
 (list
  (kbd "XF86AudioMute")          "pactl-toggle"
  (kbd "XF86AudioLowerVolume")   "pactl-down"
  (kbd "XF86AudioRaiseVolume")   "pactl-up"
  (kbd "XF86AudioMicMute")       "pactl-mic-toggle"
  (kbd "XF86TouchpadOn")         "touchpad-on"
  (kbd "XF86TouchpadOff")        "touchpad-off"
  (kbd "XF86RFKill")             "wifi-toggle"
  (kbd "XF86WebCam")             "cheese"
  (kbd "XF86MonBrightnessDown")  "bright-down"
  (kbd "XF86MonBrightnessUp")    "bright-up"
  (kbd "XF86Display")            "screen-menu"
  (kbd "XF86LaunchA")            "slingscold"
  (kbd "XF86LaunchB")            "ulauncher"
  ))

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-F1")      (getkey-func (kbd "1"))
  (kbd "s-M-F1")    (getkey-func (kbd "M-1"))
  (kbd "s-F2")      (getkey-func (kbd "2"))
  (kbd "s-M-F2")    (getkey-func (kbd "M-2"))
  (kbd "s-F3")      (getkey-func (kbd "3"))
  (kbd "s-M-F3")    (getkey-func (kbd "M-3"))
  (kbd "s-F4")      (getkey-func (kbd "4"))
  (kbd "s-M-F4")    (getkey-func (kbd "M-4"))
  (kbd "s-F5")      (getkey-func (kbd "5"))
  (kbd "s-M-F5")    (getkey-func (kbd "M-5"))
  (kbd "s-F6")      (getkey-func (kbd "6"))
  (kbd "s-M-F6")    (getkey-func (kbd "M-6"))
  (kbd "s-F7")      (getkey-func (kbd "7"))
  (kbd "s-M-F7")    (getkey-func (kbd "M-7"))
  (kbd "s-F8")      (getkey-func (kbd "8"))
  (kbd "s-M-F8")    (getkey-func (kbd "M-8"))
  (kbd "s-F9")      (getkey-func (kbd "9"))
  (kbd "s-M-F9")    (getkey-func (kbd "M-9"))
  (kbd "s-F10")     (getkey-func (kbd "0"))
  (kbd "s-M-F10")   (getkey-func (kbd "M-0"))
  (kbd "s-F11")     (getkey-func (kbd "-"))
  (kbd "s-M-F11")   (getkey-func (kbd "M--"))
  (kbd "s-F12")     (getkey-func (kbd "="))
  (kbd "s-M-F12")   (getkey-func (kbd "M-="))

  (kbd "s-C-F1")    (getkey-func (kbd "C-1"))
  (kbd "s-C-F2")    (getkey-func (kbd "C-2"))
  (kbd "s-C-F3")    (getkey-func (kbd "C-3"))
  (kbd "s-C-F4")    (getkey-func (kbd "C-4"))
  (kbd "s-C-F5")    (getkey-func (kbd "C-5"))
  (kbd "s-C-F6")    (getkey-func (kbd "C-6"))
  (kbd "s-C-F7")    (getkey-func (kbd "C-7"))
  (kbd "s-C-F8")    (getkey-func (kbd "C-8"))
  (kbd "s-C-F9")    (getkey-func (kbd "C-9"))
  (kbd "s-C-F10")   (getkey-func (kbd "C-0"))
  (kbd "s-C-F11")   (getkey-func (kbd "C--"))
  (kbd "s-C-F12")   (getkey-func (kbd "C-="))

  (kbd "s-S-F1")    (getkey-func (kbd "!"))
  (kbd "s-S-F2")    (getkey-func (kbd "@"))
  (kbd "s-S-F3")    (getkey-func (kbd "#"))
  (kbd "s-S-F4")    (getkey-func (kbd "$"))
  (kbd "s-S-F5")    (getkey-func (kbd "%"))
  (kbd "s-S-F6")    (getkey-func (kbd "^"))
  (kbd "s-S-F7")    (getkey-func (kbd "&"))
  (kbd "s-S-F8")    (getkey-func (kbd "*"))
  (kbd "s-S-F9")    (getkey-func (kbd "("))
  (kbd "s-S-F10")   (getkey-func (kbd ")"))
  (kbd "s-S-F11")   (getkey-func (kbd "_"))
  (kbd "s-S-F12")   (getkey-func (kbd "+"))
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

  (kbd "s-C-1")     (getkey-top (kbd "s-C-F1"))
  (kbd "s-C-2")     (getkey-top (kbd "s-C-F2"))
  (kbd "s-C-3")     (getkey-top (kbd "s-C-F3"))
  (kbd "s-C-4")     (getkey-top (kbd "s-C-F4"))
  (kbd "s-C-5")     (getkey-top (kbd "s-C-F5"))
  (kbd "s-C-6")     (getkey-top (kbd "s-C-F6"))
  (kbd "s-C-7")     (getkey-top (kbd "s-C-F7"))
  (kbd "s-C-8")     (getkey-top (kbd "s-C-F8"))
  (kbd "s-C-9")     (getkey-top (kbd "s-C-F9"))
  (kbd "s-C-0")     (getkey-top (kbd "s-C-F10"))
  (kbd "s-C--")     (getkey-top (kbd "s-C-F11"))
  (kbd "s-C-=")     (getkey-top (kbd "s-C-F12"))

  (kbd "s-!")       (getkey-top (kbd "s-S-F1"))
  (kbd "s-@")       (getkey-top (kbd "s-S-F2"))
  (kbd "s-#")       (getkey-top (kbd "s-S-F3"))
  (kbd "s-$")       (getkey-top (kbd "s-S-F4"))
  (kbd "s-%")       (getkey-top (kbd "s-S-F5"))
  (kbd "s-^")       (getkey-top (kbd "s-S-F6"))
  (kbd "s-&")       (getkey-top (kbd "s-S-F7"))
  (kbd "s-*")       (getkey-top (kbd "s-S-F8"))
  (kbd "s-(")       (getkey-top (kbd "s-S-F9"))
  (kbd "s-)")       (getkey-top (kbd "s-S-F10"))
  (kbd "s-_")       (getkey-top (kbd "s-S-F11"))
  (kbd "s-+")       (getkey-top (kbd "s-S-F12"))
  ))
