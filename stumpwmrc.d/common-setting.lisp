;;;; common setting -*-lisp-*-
;;

(in-package :zwm)

;; start-up message
(setf *startup-message* "")

;; color select
(set-fg-color "green")
(set-bg-color "black")
(set-focus-color "green")
(set-unfocus-color "black")
(set-float-focus-color   "green")
(set-float-unfocus-color "black")
(set-border-color "grey9")
(set-win-bg-color "grey9")

;; suppress the message StumpWM displays when it starts. Set it to NIL
(setf *suppress-frame-indicator*    t
      *suppress-abort-messages*     t
      *timeout-wait*                3
      *mouse-focus-policy*          :click
      *message-window-gravity*      :center
      *input-window-gravity*        :center)

;; window appearance
(setf *normal-border-width*         0
      *maxsize-border-width*        0
      *transient-border-width*      0
      stumpwm::+default-frame-outline-width+ 1
      stumpwm::*float-window-border*         1
      stumpwm::*float-window-title-height*   10
      stumpwm::*window-border-style*         :thin)

;; time string
(setf *time-modeline-string*       "%a %b %e %l:%M %P"
      *time-format-string-default* "%a %b %e %l:%M %P")

;; mode line
(setf *mode-line-background-color*  "black"
      *mode-line-foreground-color*  "lightgreen"
      *mode-line-border-color*      "black"
      *mode-line-border-width*      0
      *mode-line-pad-x*             0
      *mode-line-pad-y*             0
      *mode-line-timeout*           5
      *screen-mode-line-format*     (list "[^B%n^b]%W" "^> [" "^>%d]"))
