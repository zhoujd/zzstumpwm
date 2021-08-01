;;;; menu setting -*-lisp-*-
;;

(in-package :zwm)

(defparameter *app-menu*
  '(("0+INTERNET"
     ("1-Firefox" firefox)
     ("2-Chrome"  google-chrome)
     ("3-Teams"   teams))
    ("1+VIRTUAL"
     ("1-Virtualbox"   "virtualbox")
     ("2-Virt-Manager" "virt-manager"))
    ("2+FUN"
     ("1-Xlogo"    "xlogo")
     ("2-GnuChess" "xboard"))
    ("3+WORK"
     ("1-libreoffice" "libreoffice"))
    ("4+GRAPHICS"
     ("1-GIMP" "gimp"))
    ("5+VPN"
     ("1-Connect VPN"    "runvpn up")
     ("2-Disconnect VPN" "runvpn down"))
    ("6*SYSTEM"
     ("1+COMPOSITE"
      ("1-On"  "xcompmgr -C")
      ("2-Off" "killall xcompmgr"))
     ("1+AUTOLOCK"
      ("1-On"  "xautolock -time 15 -locker slock")
      ("2-Off" "killall xautolock"))))
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
                 ))
               (up-flag t)
               (up-item "0 .."))
           (cond
             ((null selection)
              nil)
             ((stringp (second selection))
              (run-shell-command (second selection)))
             ((and (symbolp (second selection))
                   (commandp (second selection)))
              (funcall (second selection)))
             (t
              (if up-flag
                (if (equalp up-item (first selection))
                    (pick (second selection))
                    (pick (append (list (list up-item options))
                                  (cdr selection)))))
              (pick (cdr selection)))))))
    (pick *app-menu*)))
