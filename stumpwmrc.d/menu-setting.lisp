;;;; menu setting -*-lisp-*-
;;

(in-package :zzwm)

(defparameter *app-menu* '(("+INTERNET"
                            ("Firefox" "firefox")
                            ("Chrome" "google-chrome")
                            ("Teams" "teams"))
                           ("+FUN"
                            ("Xlogo" "xlogo")
                            ("GnuChess" "xboard"))
                           ("+WORK"
                            ("libreoffice" "libreoffice"))
                           ("+GRAPHICS"
                            ("GIMP" "gimp"))
                           ("+VPN"
                            ("Connect VPN" "runvpn up")
                            ("Disconnect VPN" "runvpn down"))
                           ("+SYSTEM"
                            ("+COMPTON"
                             ("On" "compton")
                             ("Off" "killall compton"))
                            ("+XAUTOLOCK"
                             ("On" "xautolock -time 15 -locker slock")
                             ("Off" "killall xautolock")))
                           ))

(defcommand app-menu () ()
  "app menu"
  (labels ((pick (options)
             (let ((selection (stumpwm::select-from-menu (current-screen) options "")))
               (cond
                 ((null selection)
                  (throw 'stumpwm::error :abort))
                 ((stringp (second selection))
                  (second selection))
                 (t
                  (pick (cdr selection)))))))
    (let ((choice (pick *app-menu*)))
      (run-shell-command choice))))
