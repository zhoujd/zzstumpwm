;;;; common setting

(in-package :stumpwm)

(setq *startup-message*   nil)
(setq *startup-mode-line* nil)

;; auto start swank server
(require 'swank)
(defvar swant-server-flag nil "swant server flag")

(unless swant-server-flag
  (swank:create-server :dont-close t)
  (setq swant-server-flag t))

;; color select
(set-fg-color "green")
(set-bg-color "black")
(set-float-focus-color   "black")
(set-float-unfocus-color "black")

;; suppress the message StumpWM displays when it starts. Set it to NIL
(setf *suppress-frame-indicator*    t
      *suppress-abort-messages*     t
      *timeout-wait*                3
      *mouse-focus-policy*          :click
      *message-window-gravity*      :center
      *input-window-gravity*        :center)

;; window appearance
(setf *normal-border-width*         1
      *maxsize-border-width*        1
      *transient-border-width*      1
      +default-frame-outline-width+ 1
      *float-window-title-height*   0
      *window-border-style*         :thin)

(setf *time-modeline-string*        "%Y-%m-%d %a ^B%l:%M^b"
      *window-name-source*          :title
      *window-format*               "^B^8*%n%s%m%15t | ^7*"
      *group-format*                "%t")

;; mode line
(setf *mode-line-background-color*  "black"
      *mode-line-foreground-color*  "lightgreen"
      *mode-line-border-color*      "black"
      *mode-line-border-width*      0
      *mode-line-pad-x*             0
      *mode-line-pad-y*             0
      *mode-line-timeout*           60
      *mode-line-screen-position*   :top
      *screen-mode-line-format*     (list "[^B%n^b]%W" "^> | " "^>%d"))

(when (and *startup-mode-line*
           (not (head-mode-line (current-head))))
  (mode-line))
