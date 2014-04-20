;;;; key setting

(in-package :stumpwm)

(defkeys-top  
    ("s-w" "browse")  
    ("s-t" "exec xterm")  
    ("s-c" "sdcv")  
    ("s-o" "only")  
    ("s-s" "vsplit")  
    ("s-S" "hsplit")  
    ("s-b" "mode-line")  
    ("s-Tab" "pull-hidden-next")  
    ("Print" "exec scrot -q 10")  
    ("M-Print" "exec scrot -q 10 -s")  
  
    ("s-R" "reinit")  
    ("s-Q" "quit")  
    ("s-F2" "exec")  
    ("s-F4" "kill")  
    ("s-F11" "reboot")  
    ("s-F12" "halt")  
     
    ("s-Right" "move-focus right")  
    ("s-Left" "move-focus left" )  
    ("s-Up" "move-focus up" )  
    ("s-Down" "move-focus down" )  
    ("s-C-Right" "move-window right")  
    ("s-C-Left" "move-window left" )  
    ("s-C-Up" "move-window up" )  
    ("s-C-Down" "move-window down" )  
    ("s-S-Right" "gnext")  
    ("s-S-Left" "gprev")  
    ("s-S-Up" "prev-in-frame")  
    ("s-S-Down" "next-in-frame"))  
  
(defkeys-root  
    ("s-w" "windowlist")  
    ("s-i" "display-current-window-info"))
