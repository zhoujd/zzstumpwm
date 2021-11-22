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
