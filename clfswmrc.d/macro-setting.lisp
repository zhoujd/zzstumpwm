;;;; macro setting -*-lisp-*-
;;

(in-package :clfswm)

(defmacro concat (&rest body)
  `(concatenate 'string ,@body))
