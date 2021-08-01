;;;; menu setting -*-lisp-*-
;;

(in-package :zwm)

(defparameter *app-menu*
  '(("0+INTERNET"
     ("0-Firefox" firefox)
     ("1-Chrome" google-chrome)
     ("2-Teams" teams))
    ("1+VIRTUAL"
     ("0-Virtualbox" "virtualbox")
     ("1-Virt-Manager" "virt-manager"))
    ("2+FUN"
     ("0-Xlogo" "xlogo")
     ("1-GnuChess" "xboard"))
    ("3+WORK"
     ("0-libreoffice" "libreoffice"))
    ("4+GRAPHICS"
     ("0-GIMP" "gimp"))
    ("5+VPN"
     ("0-Connect VPN" "runvpn up")
     ("1-Disconnect VPN" "runvpn down"))
    ("6*SYSTEM"
     ("0+COMPOSITE"
      ("0-On" "xcompmgr -C")
      ("1-Off" "killall xcompmgr"))
     ("1+AUTOLOCK"
      ("0-On" "xautolock -time 15 -locker slock")
      ("1-Off" "killall xautolock"))))
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
