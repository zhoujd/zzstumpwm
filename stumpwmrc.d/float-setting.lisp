;;;; float setting -*-lisp-*-
;;

(in-package :zwm)

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

(defcommand float-window-other () ()
  "Focus previously focused floating window."
  (focus-window (cadr (group-windows (current-group)))))

(defcommand float-window-next () ()
  "Focus next floating window."
  (float-window-focus-forward
   (stumpwm::sort-windows (current-group))))

(defcommand float-window-previous () ()
  "Focus previous floating window."
  (float-window-focus-forward
   (nreverse (stumpwm::sort-windows (current-group)))))
