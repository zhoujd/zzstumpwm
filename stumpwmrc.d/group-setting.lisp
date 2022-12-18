;;;; Group setting -*-lisp-*-
;;

(in-package :zwm)

(defcommand gnew1 (&optional (initial "")) (:rest)
  "colon1"
  (let ((name (read-one-line (current-screen) "Group Name: " :initial-input initial)))
    (unless name
      (throw 'error :abort))
    (when (plusp (length name))
      (run-commands (concat "gnew " name)))))

(defcommand gnew-float1 (&optional (initial "")) (:rest)
  "colon1"
  (let ((name (read-one-line (current-screen) "Group Name: " :initial-input initial)))
    (unless name
      (throw 'error :abort))
    (when (plusp (length name))
      (run-commands (concat "gnew-float " name)))))

(defcommand window-other () ()
  "Focus previously focused floating window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (pull-hidden-other)
      (float-window-other)))

(defcommand window-next () ()
  "Focus next window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (next-in-frame)
      (float-window-next)))

(defcommand window-previous () ()
  "Focus previous window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (prev-in-frame)
      (float-window-previous)))

(defcommand pull-window-next () ()
  "Pull next window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (pull-hidden-next)
      (float-window-next)))

(defcommand pull-window-prev () ()
  "Pull previous window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (pull-hidden-previous)
      (float-window-previous)))

(defcommand move-focus-left () ()
  "move focus left"
  (if (typep (current-group) 'stumpwm::tile-group)
      (move-focus :left)
      (move-float-window -10 0)))

(defcommand move-focus-right () ()
  "move focus right"
  (if (typep (current-group) 'stumpwm::tile-group)
      (move-focus :right)
      (move-float-window +10 0)))

(defcommand move-focus-up () ()
  "move focus up"
  (if (typep (current-group) 'stumpwm::tile-group)
      (move-focus :up)
      (move-float-window 0 -10)))

(defcommand move-focus-down () ()
  "move focus down"
  (if (typep (current-group) 'stumpwm::tile-group)
      (move-focus :down)
      (move-float-window 0 +10)))

;;move window keys
(defcommand move-window-left () ()
  "move window left"
  (if (typep (current-group) 'stumpwm::tile-group)
      (move-window :left)
      (resize-float-window -10 0)))

(defcommand move-window-right () ()
  "move window right"
  (if (typep (current-group) 'stumpwm::tile-group)
      (move-window :right)
      (resize-float-window +10 0)))

(defcommand move-window-up () ()
  "move window up"
  (if (typep (current-group) 'stumpwm::tile-group)
      (move-window :up)
      (resize-float-window 0 -10)))

(defcommand move-window-down () ()
  "move window down"
  (if (typep (current-group) 'stumpwm::tile-group)
      (move-window :down)
      (resize-float-window 0 +10)))

;;exchange keys
(defcommand exchange-left () ()
  "exchange left"
  (if (typep (current-group) 'stumpwm::tile-group)
      (exchange-direction :left)
      (float-window-gravity :left)))

(defcommand exchange-right () ()
  "exchange right"
  (if (typep (current-group) 'stumpwm::tile-group)
      (exchange-direction :right)
      (float-window-gravity :right)))

(defcommand exchange-up () ()
  "exchange up"
  (if (typep (current-group) 'stumpwm::tile-group)
      (exchange-direction :up)
      (float-window-gravity :top)))

(defcommand exchange-down () ()
  "exchange down"
  (if (typep (current-group) 'stumpwm::tile-group)
      (exchange-direction :down)
      (float-window-gravity :bottom)))

(defcommand group-print () ()
  "print current group name"
  (message "Current Group: ~A"
           (stumpwm::group-name (current-group))))

(defcommand group-fresh () ()
  "refresh current group"
  (gother)
  (gother))

(defcommand group-move () ()
  "move window to-group"
  (let ((group (current-group)))
    (run-commands "gmove")
    (unless (typep group 'stumpwm::tile-group)
      (group-fresh))))

(defcommand group-fullscreen () ()
  "group fullscreen"
  (if (current-window)
      (if (typep (current-group) 'stumpwm::tile-group)
          (fullscreen)
          (float-window-gravity :center))
      (message "No fullscreen for root")))

(defcommand group-desktop () ()
  "group desktop"
  (if (typep (current-group) 'stumpwm::tile-group)
      (toggle-root)
      (message "No support in float group.")))

;; save & restore group
(progn
  (defvar *zz-group-file* "~/.stumpwm-group" "group layout file name")
  (defcommand dump-group-file () ()
    "dump group"
    (dump-group-to-file *zz-group-file*))
  (defcommand restore-group-file () ()
    "restore group"
    (if (probe-file *zz-group-file*)
        (stumpwm::restore-from-file *zz-group-file*)
        (message "This no is ~a." *zz-group-file*))))

(defcommand window-info () ()
  "Shows the properties of the current window. These properties can be
used for matching windows with run-or-raise or window placement-merules."
  (let ((w (current-window))
        (nl (string #\NewLine))
        (*suppress-echo-timeout* t))
    (echo-string (current-screen)
                 (concat "class:    " (stumpwm::window-class w) nl
                         "instance: " (stumpwm::window-res w) nl
                         "type:     " (string (stumpwm::window-type w)) nl
                         "role:     " (stumpwm::window-role w) nl
                         "title:    " (stumpwm::window-title w) nl
                         "width:    " (format nil "~a" (stumpwm::window-width w)) nl
                         "height    " (format nil "~a" (stumpwm::window-height w))))))

(defcommand resize-direction (d) ((:direction "Direction: "))
  "Resize frame to direction @var{d}"
  (let* ((formats '((:up . "0 -~D")
                    (:down . "0 ~D")
                    (:left . "-~D 0")
                    (:right . "~D 0")))
         (deltas (format nil (cdr (assoc (princ d) formats))
                         *resize-increment*))
         (to-be-run (concatenate 'string "resize " deltas)))
    (if (and (typep (current-group) 'stumpwm::tile-group)
             (cdr (stumpwm::group-frames (current-group))))
        (run-commands to-be-run)
        (message "There is no others frames."))))

(defcommand pull-group-windows () ()
  "pull all group windows to current frame"
  (if (and (typep (current-group) 'stumpwm::tile-group)
           (cdr (stumpwm::group-frames (current-group))))
      (dolist (window (stumpwm::group-windows (current-group)))
        (stumpwm::pull-window window))
      (message "There is no others frames.")))
