;;;; Group setting -*-lisp-*-
;;

(in-package :zwm)

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
  (if (typep (current-group) 'stumpwm::tile-group)
      (fullscreen)
      (float-window-gravity :center)))
