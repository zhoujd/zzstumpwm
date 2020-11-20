;;;; macro setting -*-lisp-*-
;;

(in-package :zzwm)

(defmacro replace-hook (hook fn)
  `(remove-hook ,hook ,fn)
  `(add-hook ,hook ,fn))

(defmacro getkey-top (key)
  `(lookup-key *top-map* ,key))

(define-stumpwm-type :password (input prompt)
  (let ((history stumpwm::*input-history*)
        (arg (argument-pop input))
        (fn (symbol-function 'stumpwm::draw-input-bucket)))
    (unless arg
      (unwind-protect
           (setf (symbol-function 'stumpwm::draw-input-bucket)
                 #'(lambda (screen prompt input)
                     (let ((i (copy-structure input)))
                       (setf (stumpwm::input-line-string i)
                             (make-string (length (stumpwm::input-line-string i))
                                          :initial-element #\*))
                       (funcall fn screen prompt i)))
                 arg (read-one-line (current-screen) prompt))
        (setf (symbol-function 'stumpwm::draw-input-bucket) fn
              stumpwm::*input-history* history))
      arg)))

(defmacro define-sudo-command (name command &key output)
  (let ((cmd (gensym)))
    `(defcommand ,name (password) ((:password "sudo password: "))
       "sudo command"
       (let ((,cmd (concat "echo '" password "' | sudo -S " ,command)))
         ,(if output
              `(stumpwm::run-prog-collect-output *shell-program* "-c" ,cmd)
              `(stumpwm::run-prog *shell-program* :args (list "-c" ,cmd) :wait nil))))))

(defmacro def-run-or-raise-command (cmd prop)
  (let ((cmd-str (string-downcase (symbol-name cmd))))
    `(defcommand ,cmd () ()
       "run or raise command"
       (run-or-raise ,cmd-str ,prop))))

(defmacro make-web-jump (name prefix)
  `(defcommand ,(intern name) (search) ((:rest ,(concatenate 'string (string-capitalize name) " Search: ")))
     "web jump"
     (substitute #\+ #\Space search)
     (run-shell-command (concatenate 'string ,prefix search))))
