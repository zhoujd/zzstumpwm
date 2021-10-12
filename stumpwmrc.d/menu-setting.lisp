;;;; menu setting -*-lisp-*-
;;

(in-package :zwm)

(defparameter *app-menu*
  '(("1+INTERNET"
     ("1-Firefox"        firefox)
     ("2-Chrome"         google-chrome)
     ("3-Teams"          teams))
    ("2+VIRTUAL"
     ("1-Virtualbox"     "virtualbox")
     ("2-Virt-Manager"   "virt-manager"))
    ("3+MEDIA"
     ("1-Audacity"       "audacity")
     ("2-Openshot"       "openshot")
     ("3-Vidcutter"      "vidcutter"))
    ("4+WORK"
     ("1-libreoffice"    "libreoffice"))
    ("5+GRAPHICS"
     ("1-GIMP"           "gimp"))
    ("6+VPN"
     ("1-Connect VPN"    "runvpn up")
     ("2-Disconnect VPN" "runvpn down"))
    ("7+SYSTEM"
     ("1+COMPOSITE"
      ("1-On"            "xcompmgr -C")
      ("2-Off"           "killall xcompmgr"))
     ("2+AUTOLOCK"
      ("1-On"            "xautolock -time 15 -locker slock")
      ("2-Off"           "killall xautolock"))))
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
              (if (equalp ".." (first selection))
                  (pick (second selection))
                  (pick (append (list (list ".." options))
                                (cdr selection)))))))))
    (pick *app-menu*)))
