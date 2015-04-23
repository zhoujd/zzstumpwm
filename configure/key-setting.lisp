;;;; key setting

(in-package :stumpwm)

;; *zz-exec-map*
(apply-keys-to-map
 *zz-exec-map*
 (list
  (kbd "f") "exec firefox"
  (kbd "m") "exec gnome-system-monitor"
  (kbd "s") "exec gnome-control-center"
  (kbd "e") "exec evince"
  (kbd "n") "exec nautilus --no-desktop"
  ))

;; *zz-x-map*
(apply-keys-to-map
 *zz-x-map*
 (list
  (kbd "1") "only"
  (kbd "0") "remove"
  ))

;; top map
(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-Tab")     "pull-hidden-next"  
  (kbd "Print")     "exec scrot -q 10"  
  (kbd "M-Print")   "exec scrot -q 10 -s"  

  (kbd "s-B")       "mode-line"
  (kbd "s-R")       "reinit"
  (kbd "s-Q")       "quit" 
  (kbd "s-W")       "browse"
  
  (kbd "s-F2")      "exec"  
  (kbd "s-F4")      "kill"  
  (kbd "s-F11")     "reboot"  
  (kbd "s-F12")     "halt" 
  
  (kbd "s-Right")   "move-focus right"  
  (kbd "s-Left")    "move-focus left"  
  (kbd "s-Up")      "move-focus up"  
  (kbd "s-Down")    "move-focus down" 
  
  (kbd "s-M-Right") "move-window right"  
  (kbd "s-M-Left")  "move-window left"  
  (kbd "s-M-Up")    "move-window up"  
  (kbd "s-M-Down")  "move-window down"  
  
  (kbd "s-C-Right") "gnext"
  (kbd "s-C-Left")  "gprev"  
  (kbd "s-C-Up")    "prev-in-frame"  
  (kbd "s-C-Down")  "next-in-frame"    
  ))

;; root map
(apply-keys-to-map
 *root-map*
 (list
  (kbd "s-I")       "display-current-window-info"
  ))
