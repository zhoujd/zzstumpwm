;;;; common setting

(in-package :stumpwm)

(require 'swank)
(swank:create-server :dont-close t)

(set-fg-color "green")  
(set-bg-color "black")

(set-float-focus-color   "black")
(set-float-unfocus-color "black")

;; suppress the message StumpWM displays when it starts. Set it to NIL  
(setf *startup-message*          nil  
      *suppress-frame-indicator* t  
      *suppress-abort-messages*  t  
      *timeout-wait*             3  
      *mouse-focus-policy*       :click
      *message-window-gravity*   :center
      *input-window-gravity*     :center)  
  
;;; Window Appearance  
(setf *normal-border-width*         1
      *maxsize-border-width*        1  
      *transient-border-width*      1  
      +default-frame-outline-width+ 1  
      *float-window-title-height*   0  
      *window-border-style*         :thin)
