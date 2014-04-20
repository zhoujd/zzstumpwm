;;;; key setting

(in-package :stumpwm)

;; change the prefix key to something else
(set-prefix-key (kbd "s-t"))

(defvar *zz-exec-map* (make-sparse-keymap)
  "Keymap for executing shell commands or switching to running applications.")

(defkeys-top
    ("s-e"       *zz-exec-map*))

(defkeys-top  
    ("s-W"       "browse")  
    ("s-B"       "mode-line")  
    ("s-Tab"     "pull-hidden-next")  
    ("Print"     "exec scrot -q 10")  
    ("M-Print"   "exec scrot -q 10 -s")  
  
    ("s-R"       "reinit")  
    ("s-Q"       "quit")  
    ("s-F2"      "exec")  
    ("s-F4"      "kill")  
    ("s-F11"     "reboot")  
    ("s-F12"     "halt")  
     
    ("s-Right"   "move-focus right")  
    ("s-Left"    "move-focus left" )  
    ("s-Up"      "move-focus up" )  
    ("s-Down"    "move-focus down" )  
    ("s-C-Right" "move-window right")  
    ("s-C-Left"  "move-window left" )  
    ("s-C-Up"    "move-window up" )  
    ("s-C-Down"  "move-window down" )  
    ("s-S-Right" "gnext")  
    ("s-S-Left"  "gprev")  
    ("s-S-Up"    "prev-in-frame")  
    ("s-S-Down"  "next-in-frame"))  
  
(defkeys-root  
    ("s-`"       "windowlist")  
    ("s-I"       "display-current-window-info"))
