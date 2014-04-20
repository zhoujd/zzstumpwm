;;;; key setting

(in-package :stumpwm)

;; change the prefix key to something else
(set-prefix-key (kbd "s-t"))

(defvar *zz-exec-map* (make-sparse-keymap)
  "Keymap for executing shell commands or switching to running applications.")
(defvar *zz-x-map* (make-sparse-keymap)
  "Keymap simallar emacs C-x.")

(defvar *zz-window-map* (make-sparse-keymap)
  "Keymap window")
(defvar *zz-menu-map* (make-sparse-keymap)
  "Keymap menu")
(defvar *zz-view-map* (make-sparse-keymap)
  "Keymap view")
(defvar *zz-help-map* (make-sparse-keymap)
  "Keymap help")

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-e")    *zz-exec-map*
  (kbd "s-x")    *zz-x-map*
  (kbd "s-w")    *zz-window-map*
  (kbd "s-v")    *zz-view-map*
  (kbd "s-h")    *zz-help-map*
  ))

(defkeys-top
    ("s-x"       *zz-x-map*)
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
