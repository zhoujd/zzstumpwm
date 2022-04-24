;;;; macro setting -*-lisp-*-
;;

(in-package :zwm)

(defmacro replace-hook (hook fn)
  `(remove-hook ,hook ,fn)
  `(add-hook ,hook ,fn))

(defmacro getkey-top (key)
  `(lookup-key *top-map* ,key))

(defmacro make-web-jump (name prefix)
  `(defcommand ,(intern name) (search) ((:rest ,(concatenate 'string (string-capitalize name) " Search: ")))
     "web jump"
     (substitute #\+ #\Space search)
     (run-shell-command (concatenate 'string ,prefix search))))

(defmacro def-sudo-command (name command &key output)
  (let ((cmd (gensym)))
    `(defcommand ,name () ()
       "sudo command"
       (let* ((prompt "sudo password: ")
              (password (read-one-line (current-screen) prompt :password t))
              (,cmd (concat "echo '" password "' | sudo -S " ,command)))
         ,(if output
              `(stumpwm::run-prog-collect-output *shell-program* "-c" ,cmd)
              `(stumpwm::run-prog *shell-program* :args (list "-c" ,cmd) :wait nil))))))

(defmacro def-run-or-raise-command (cmd prop)
  (let ((cmd-str (string-downcase (symbol-name cmd))))
    `(defcommand ,cmd () ()
       "run or raise command"
       (run-or-raise ,cmd-str ,prop))))

(defmacro def-run-or-raise-terminal (cmd)
  (let ((cmd-str (string-downcase (symbol-name cmd))))
    `(defcommand ,cmd () ()
       "run or raise urxvt command"
       (let* ((name ,cmd-str)
              (line (format nil "urxvt -name ~a -e ~a" name name)))
         (run-or-raise line `(:instance ,name))))))
