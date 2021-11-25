;;;; Group setting -*-lisp-*-
;;

(in-package :zwm)


(defcommand window-other () ()
  "Focus previously focused floating window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "pull-hidden-other")
      (run-commands "float-window-other")))

(defcommand window-next () ()
  "Focus next window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "next-in-frame")
      (run-commands "float-window-next")))

(defcommand window-previous () ()
  "Focus previous window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "prev-in-frame")
      (run-commands "float-window-previous")))

(defcommand pull-window-next () ()
  "Pull next window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "pull-hidden-next")
      (run-commands "float-window-next")))

(defcommand pull-window-prev () ()
  "Pull previous window."
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "pull-hidden-previous")
      (run-commands "float-window-previous")))

;;move focus keys
(defcommand move-focus-left () ()
  "move focus left"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "move-focus left")
      (run-commands "move-float-window -10 0")))

(defcommand move-focus-right () ()
  "move focus right"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "move-focus right")
      (run-commands "move-float-window +10 0")))

(defcommand move-focus-up () ()
  "move focus up"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "move-focus up")
      (run-commands "move-float-window 0 -10")))

(defcommand move-focus-down () ()
  "move focus down"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "move-focus down")
      (run-commands "move-float-window 0 +10")))

;;move window keys
(defcommand move-window-left () ()
  "move window left"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "move-window left")
      (run-commands "resize-float-window -10 0")))

(defcommand move-window-right () ()
  "move window right"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "move-window right")
      (run-commands "resize-float-window +10 0")))

(defcommand move-window-up () ()
  "move window up"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "move-window up")
      (run-commands "resize-float-window 0 -10")))

(defcommand move-window-down () ()
  "move window down"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "move-window down")
      (run-commands "resize-float-window 0 +10")))

;;exchange keys
(defcommand exchange-left () ()
  "exchange left"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "exchange-direction left")
      (run-commands "float-window-gravity left")))

(defcommand exchange-right () ()
  "exchange right"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "exchange-direction right")
      (run-commands "float-window-gravity right")))

(defcommand exchange-up () ()
  "exchange up"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "exchange-direction up")
      (run-commands "float-window-gravity top")))

(defcommand exchange-down () ()
  "exchange down"
  (if (typep (current-group) 'stumpwm::tile-group)
      (run-commands "exchange-direction down")
      (run-commands "float-window-gravity bottom")))

(defcommand group-refresh () ()
  "refresh current group"
  (let ((group (current-group)))
    (run-commands "gselect Default")
    (gselect group)))
