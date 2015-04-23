;;;; other setting

(in-package :stumpwm)

(defun cat (&rest strings)
    (apply 'concatenate 'string strings))

(defcommand display-current-window-info () ()
  "Shows the properties of the current window. These properties can be
used for matching windows with run-or-raise or window placement
-merules."
  (let ((w (current-window))
        (*suppress-echo-timeout* t)
        (nl (string #\NewLine)))

    ;; (message-no-timeout "class: ~a~%instance~a~%..." (window-class w) (window-res w) ...)
    (echo-string (current-screen)
                 (concat "class:    " (window-class w) nl
                         "instance: " (window-res w) nl
                         "type:     " (string (window-type w)) nl
                         "role:     " (window-role w) nl
                         "title:    " (window-title w) nl
                         "width:    " (format nil "~a" (window-width w)) nl
                         "height    " (format nil "~a" (window-height w))))))


(defcommand reboot () ()
    (run-shell-command "sudo /sbin/shutdown -r now"))

(defcommand halt () ()
    (run-shell-command "sudo /sbin/shutdown -P now"))

(defcommand reinit () ()
    (run-commands "reload" "loadrc"))

(defparameter +browser-name+ "firefox")
(defparameter +browser-class+ "Firefox")
(defcommand browse () ()
    (run-or-raise +browser-name+ `(:class ,+browser-class+)))
