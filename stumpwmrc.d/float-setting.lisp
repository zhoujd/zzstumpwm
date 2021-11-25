;;;; float setting -*-lisp-*-
;;

(in-package :zwm)
(use-package :stumpwm.floating-group)

(defun float-window-focus-forward
    (window-list &optional (window (group-current-window
                                    (current-group))))
  "Focus the next window in WINDOW-LIST after WINDOW."
  (let* ((wins (cdr (member window window-list)))
         (nw (if wins
                 (car wins)
                 ;; If the last window in the list is focused, then
                 ;; focus the first one.
                 (car window-list))))
    (and nw (focus-window nw))))

(defcommand (float-window-other float-group) () ()
  "Focus previously focused floating window."
  (let ((win (cadr (group-windows (current-group)))))
    (if win
        (focus-window win)
        (message "No other window."))))

(defcommand (float-window-next float-group) () ()
  "Focus next floating window."
  (float-window-focus-forward
   (stumpwm::sort-windows (current-group))))

(defcommand (float-window-previous float-group) () ()
  "Focus previous floating window."
  (float-window-focus-forward
   (nreverse (stumpwm::sort-windows (current-group)))))

(defcommand (move-float-window float-group)
    (x y) ((:number "+ X: ") (:number "+ Y: "))
  "Move current floating window by X and Y pixels."
  (stumpwm.floating-group::float-window-move-resize
   (current-window)
   :x (+ (window-x (current-window)) x)
   :y (+ (window-y (current-window)) y)))

(defcommand (resize-float-window float-group)
    (width height) ((:number "+ Width: ") (:number "+ Height: "))
  "Resize current floating window by WIDTH and HEIGHT pixels."
  (stumpwm.floating-group::float-window-move-resize
   (current-window)
   :width (+ (window-width (current-window)) width)
   :height (+ (window-height (current-window)) height)))

(defcommand (float-window-gravity float-group)
    (gravity) ((:gravity "Gravity: "))
  "Move current floating window to a particular place of the screen.
GRAVITY controls where the window will appear.  Possible values are:
:center, :top, :right, :bottom, :left, :top, :top-left, :bottom-right,
:bottom-left."
  (let* ((screen-width  (screen-width (current-screen)))
         (screen-height (screen-height (current-screen)))
         (window-width  (+ (window-width (current-window))
                           (* 2 stumpwm.floating-group::*float-window-border*)))
         (window-height (+ (window-height (current-window))
                           stumpwm.floating-group::*float-window-border*
                           stumpwm.floating-group::*float-window-title-height*))
         (x-right  (- screen-width window-width))
         (x-center (round (/ x-right 2)))
         (y-bottom (- screen-height window-height))
         (y-center (round (/ y-bottom 2)))
         (coords (ccase gravity
                   (:center       (cons x-center y-center))
                   (:top-left     (cons 0 0))
                   (:top          (cons nil 0))
                   (:top-right    (cons x-right 0))
                   (:right        (cons x-right nil))
                   (:bottom-right (cons x-right y-bottom))
                   (:bottom       (cons nil y-bottom))
                   (:bottom-left  (cons 0 y-bottom))
                   (:left         (cons 0 nil)))))
    (stumpwm.floating-group::float-window-move-resize
     (current-window)
     :x (car coords) :y (cdr coords))))

(defun float-focus-window (win lastw)
  "focus float window"
  (declare (ignore lastw))
  (when (typep (current-group) 'float-group)
    (focus-window win)))
(add-hook *focus-window-hook* 'float-focus-window)
