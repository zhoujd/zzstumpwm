;;;; macro setting -*-lisp-*-
;;

(in-package :stumpwm)

(defmacro zz/replace-hook (hook fn)
  `(remove-hook ,hook ,fn)
  `(add-hook ,hook ,fn))

(defmacro zz/getkey-top (key)
  `(lookup-key *top-map* ,key))

(define-stumpwm-type :zz/password (input prompt)
  (let ((history *input-history*)
        (arg (argument-pop input))
        (fn (symbol-function 'draw-input-bucket)))
    (unless arg
      (unwind-protect
           (setf (symbol-function 'draw-input-bucket)
                 #'(lambda (screen prompt input)
                     (let ((i (copy-structure input)))
                       (setf (input-line-string i)
                             (make-string (length (input-line-string i))
                                          :initial-element #\*))
                       (funcall fn screen prompt i)))
                 arg (read-one-line (current-screen) prompt))
        (setf (symbol-function 'draw-input-bucket) fn
              *input-history* history))
      arg)))

(defmacro zz/define-sudo-command (name command &key output)
  (let ((cmd (gensym)))
    `(defcommand ,name (password) ((:zz/password "sudo password: "))
       "sudo command"
       (let ((,cmd (concat "echo '" password "' | sudo -S " ,command)))
         ,(if output
              `(run-prog-collect-output *shell-program* "-c" ,cmd)
              `(run-prog *shell-program* :args (list "-c" ,cmd) :wait nil))))))

(defmacro zz/def-run-or-raise-command (cmd prop)
  (let ((cmd-str (string-downcase (symbol-name cmd))))
    `(defcommand ,cmd () ()
       "run or raise command"
       (run-or-raise ,cmd-str ,prop))))

(defmacro zz/make-web-jump (name prefix)
  `(defcommand ,(intern name) (search) ((:rest ,(concatenate 'string name " search: ")))
     "web jump"
     (substitute #\+ #\Space search)
     (run-shell-command (concatenate 'string ,prefix search))))
