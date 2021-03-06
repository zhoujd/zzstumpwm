;;;; menu setting -*-lisp-*-
;;

(in-package :zwm)

(defparameter *app-menu*
  '(("+INTERNET"
     ("Firefox" firefox)
     ("Chrome" google-chrome)
     ("Teams" teams))
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
      ("Off" "killall xautolock"))))
  "Where the menu structure is held")

(defun load-menu (file-name &key (strip 0))
  "Loads in a file containing the values for *app-menu*."
  (with-open-file (file file-name)
    (when (char= #\# (peek-char nil file)) (read-line file))
    (let* ((*read-eval* nil)
           (list (list (read file))))
      (dotimes (i strip) (setf list (mapcan #'cdr list)))
      (setf *app-menu* (nconc *app-menu* list)))))

(defun commandp (command-name)
  (loop
     :for command :being :the :hash-keys :of stumpwm::*command-hash*
     :when (string= (symbol-name command-name)
                    (symbol-name command ))
     :return command))

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
              (pick (cdr selection)))))))
    (pick *app-menu*)))
