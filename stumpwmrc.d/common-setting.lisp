;;;; common setting -*-lisp-*-
;;

(in-package :zwm)

;; start-up message
(setf *startup-message* (machine-instance))

;; color select
(let ((foreground-color "green")
      (background-color "black")
      (border-color     "grey9"))
  (set-fg-color            foreground-color)
  (set-bg-color            background-color)
  (set-win-bg-color        background-color)
  (set-focus-color         foreground-color)
  (set-unfocus-color       background-color)
  (set-float-focus-color   foreground-color)
  (set-float-unfocus-color background-color)
  (set-border-color        border-color))

(set-msg-border-width      1)
(set-frame-outline-width   1)

;; suppress the message display
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
      *message-window-padding*      10
      *window-border-style*         :thin)

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
      *screen-mode-line-format*     (list "[^B%n^b]%W" "^>[%d]"))
