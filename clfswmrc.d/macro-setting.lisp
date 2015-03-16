;;;; macro setting -*-lisp-*-
;;

(in-package :clfswm)

(defmacro concat (&rest body)
  `(concatenate 'string ,@body))
<<<<<<< HEAD
=======

>>>>>>> 213a8e659f29d2b135d2ce17ae3c1c082959c6d5
