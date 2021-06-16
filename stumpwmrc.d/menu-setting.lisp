;;;; menu setting -*-lisp-*-
;;

(in-package :zzwm)

(defparameter *app-menu* '(("+INTERNET"
                            ;;sub menu
                            ("Firefox" "firefox")
                            ("Chrome" "google-chrome")
                            ("Teams" "teams"))
                           ("+FUN"
                            ;;sub menu
                            ("Xlogo" "xlogo")
                            ("GnuChess" "xboard"))
                           ("+WORK"
                            ;;submenu
                            ("libreoffice" "libreoffice"))
                           ("+GRAPHICS"
                            ;;submenu
                            ("GIMP" "gimp"))
                           ("+VPN"
                            ;;submenu
                            ("Connect VPN" "runvpn up")
                            ("Disconnect VPN" "runvpn down"))
                           ("+SYSTEM"
                            ("+compton"
                             ;;submenu
                             ("On" "compton")
                             ("Off" "killall compton"))
                            ("+xautolock"
                             ;;submenu
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
