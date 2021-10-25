;;;; menu setting -*-lisp-*-
;;

(in-package :zwm)

(defparameter *app-menu*
  '(("1+INTERNET"
     ("1-Firefox"         firefox)
     ("2-Chrome"          google-chrome)
     ("3-Teams"           teams))
    ("2+VIRTUAL"
     ("1-Virtualbox"      "virtualbox")
     ("2-Virt-Manager"    "virt-manager"))
    ("3+MEDIA"
     ("1-Audacity"        "audacity")
     ("2-Openshot"        "openshot")
     ("3-Vidcutter"       "vidcutter"))
    ("4+WORK"
     ("1-libreoffice"     "libreoffice"))
    ("5+GRAPHICS"
     ("1-GIMP"            "gimp"))
    ("6+Network"
     ("1+WIFI"
      ("1-TOGGLE"         wifi-toggle)
      ("2-CMCC"           "nmcli dev wifi con CMCC-bUpT")
      ("3-ZZ"             "nmcli dev wifi con zz-home-net"))
     ("2+VPN"
      ("1-Connect VPN"    "runvpn up")
      ("2-Disconnect VPN" "runvpn down")))
    ("7+SYSTEM"
     ("1+COMPOSITE"
      ("1-On"             "xcompmgr -C")
      ("2-Off"            "killall xcompmgr"))
     ("2+AUTOLOCK"
      ("1-On"             "xautolock -time 15 -locker slock")
      ("2-Off"            "killall xautolock"))))
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

(defcommand resolution () ()
  "select resolution for stumpwm"
  (let ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("1-1920x1080" "--mode 1920x1080")
                         ("2-1600x900"  "--mode 1600x900")
                         ("3-1280x720"  "--mode 1280x720"))
                       "Select display resolution")))
        (output "xrandr | grep primary | awk '{print $1}'"))
    (run-shell-command
     (format nil "xrandr --output `~a` ~a" output choice))))

(defcommand keymap-menu () ()
  "keymap menu"
  (let* ((choice (cadr (select-from-menu
                        (current-screen)
                        '(("1-default" "default.xmodmap")
                          ("2-hyper"   "hyper.xmodmap")
                          ("3-laptop"  "laptop.xmodmap"))
                        "Select keyboard layout")))
         (config (merge-pathnames
                  (concat "misc/.xmodmap/" choice) *zz-load-directory*)))
    (run-shell-command "setcapslock off")
    (run-shell-command (format nil "xmodmap ~a" config))))

(defcommand wifi-menu () ()
  "wifi menu"
  (run-shell-command
   (format nil "~a"
           (merge-pathnames "libexec/rofi-wifi" *zz-load-directory*))))

(defcommand tmux-menu () ()
  "tmux menu"
  (run-shell-command
   (format nil "~a"
           (merge-pathnames "libexec/tmux-session" *zz-load-directory*))))

(defcommand screen-menu () ()
  "screen menu"
  (run-shell-command
   (format nil "~a"
           (merge-pathnames "libexec/rofi-screen" *zz-load-directory*))))

(defcommand locate-menu () ()
  "locate menu"
  (run-shell-command
   (format nil "~a"
           (merge-pathnames "libexec/rofi-locate" *zz-load-directory*))))

(defcommand search-menu () ()
  "search menu"
  (run-shell-command
   (format nil "~a"
           (merge-pathnames "libexec/rofi-search" *zz-load-directory*))))

(defcommand system-action () ()
  "system actions"
  (let ((choice (cadr (select-from-menu
                       (current-screen)
                       '(("1-logout"    "kill-stumpwm")
                         ("2-reboot"    "reboot")
                         ("3-shutdown"  "shutdown"))
                       "Select system action"))))
    (when choice
      (stumpwm::eval-command (format nil "~a" choice)))))

(defcommand kill-from-windowlist (&optional (fmt *window-format*)) (:rest)
  "kill from windowlist"
  (let ((window-to-kill (stumpwm::select-window-from-menu
                         (stumpwm::group-windows (current-group))
                         fmt)))
    (when window-to-kill
      (stumpwm::kill-window window-to-kill))))
