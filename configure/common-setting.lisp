;;;; common setting

(in-package :stumpwm)

(require 'swank)
(swank:create-server :dont-close t)

;; change the prefix key to something else
(set-prefix-key (kbd "s-z"))

(set-fg-color "green")  
(set-bg-color "black")

(set-float-focus-color "black")
(set-float-unfocus-color "black")

(setq *message-window-gravity* :center)
(setq *input-window-gravity* :center)

(setf *mode-line-border-width* 3)
  
;; suppress the message StumpWM displays when it starts. Set it to NIL  
(setf *startup-message* nil  
      *suppress-frame-indicator* t  
      *suppress-abort-messages* t  
      *timeout-wait* 3  
      *mouse-focus-policy* :click ;; :click, :ignore, :sloppy  
      *message-window-gravity* :bottom-left  
      *input-window-gravity* :bottom-left)  
  
;;; Window Appearance  
(setf *normal-border-width* 1  
      *maxsize-border-width* 1  
      *transient-border-width* 1  
      +default-frame-outline-width+ 1  
      *float-window-title-height* 0  
      *window-border-style* :thin) ; :thick :thin :tight :none  
  
(setf *time-modeline-string* "%Y-%m-%d %a ^B%l:%M^b"   
      *window-name-source* :title  
      *window-format* "^B^8*%n%s%m%15t | ^7*"  
      *group-format* "%t")  
  
 ;;;; The Mode Line  
(setf *mode-line-background-color* "black"  
      *mode-line-foreground-color* "lightgreen"  
      *mode-line-border-color* "black"  
      *mode-line-border-width* 0  
      *mode-line-pad-x* 0  
      *mode-line-pad-y* 0  
      *mode-line-timeout* 60  
      *mode-line-screen-position* :top  
      *screen-mode-line-format* (list "[^B%n^b]%W" "^>%m | " "^>%d"))  
  
;; turn on/off the mode line for the current screen only.  
(if (not (head-mode-line (current-head)))  
     (toggle-mode-line (current-screen) (current-head)))

