;;;; startup setting -*-lisp-*-
;;

(in-package :zwm)

(defun ps-exists (ps)
  "check process exist"
  (let ((f "ps -ef | grep ~S | grep -v -e grep -e stumpish | wc -l"))
    (< 0 (parse-integer (run-shell-command (format nil f ps) t)))))

(defun start-command-ps (command &key options (background t))
  "start command if not exist"
  (unless (ps-exists command)
    (run-shell-command
     (concat command " " options " " (when background "&")))))

(mapc
 #'(lambda (cmd)
     (apply #'start-command-ps cmd))
 (list
  (list "xset" :options "b off")
  (list "xsetroot" :options "-cursor_name left_ptr")
  (list "nitrogen" :options "--restore")
  (list "ulauncher" :options "--hide-window --no-window-shadow")
  (list "urxvtd" :options "-q -f -o")
  (list "redshift -l +34.41:+121.29")
  (list "unclutter")
  (list "keynav")
  (list "dunst")
  (list "nm-applet")
  (list "blueman-applet")
  ))

(defun run-command-ps (command &key options (background t))
  "run command ps"
  (run-shell-command
   (concat command " " options " " (when background "&"))))

(defun start-hook-ps ()
  "start hook ps"
  (mapc
   #'(lambda (cmd)
       (apply #'run-command-ps cmd))
   (list
    (list "xmodmap" :options "~/.Xmodmap")
    )))

(stumpwm:add-hook stumpwm:*start-hook* #'start-hook-ps)
