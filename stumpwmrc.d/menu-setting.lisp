;;;; menu setting -*-lisp-*-
;;

(in-package :zzwm)

(defparameter *app-menu* '(("+INTERNET"
                            ("Firefox" "firefox")
                            ("Chrome" "google-chrome")
                            ("Teams" "teams"))
                           ("+VIRTUAL"
                            ("Virtualbox" "virtualbox")
                            ("Virt-Manager" "virt-manager"))
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
  "Show the application menu"
  (labels
      ((pick (options)
         (let ((selection
                 (select-from-menu
                  (current-screen) ; screen
                  options          ; table
                  nil              ; prompt
                  0                ; initial-selection
                  )))
           (cond
             ((null selection)
              nil)
             ((stringp (second selection))
              (run-shell-command (second selection)))
             ((and (symbolp (second selection))
                  (commandp (second selection)))
              (funcall (second selection)))
             (t
              (if (equalp ".." (first selection))
                  (pick (second selection))
                  (pick (append (list (list ".." options))
                                (cdr selection)))))))))
    (pick *app-menu*)))
