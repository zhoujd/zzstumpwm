;;;; macro setting

(in-package :stumpwm)

(defmacro replace-hook (hook fn)  
  `(remove-hook ,hook ,fn)  
  `(add-hook ,hook ,fn))  

; If you like Meta (most probably alt on your keyboard) more than  
; Super (which is the Windows key on mine), change 's-' into 'M-'.  
(defmacro defkey-top (key cmd)  
  `(define-key *top-map* (kbd ,key) ,cmd))  

(defmacro defkeys-top (&rest keys)  
  (let ((ks (mapcar #'(lambda (k) (cons 'defkey-top k)) keys)))  
    `(progn ,@ks)))  

(defmacro defkey-root (key cmd)  
  `(define-key *root-map* (kbd ,key) ,cmd))  
  
(defmacro defkeys-root (&rest keys)  
  (let ((ks (mapcar #'(lambda (k) (cons 'defkey-root k)) keys)))  
    `(progn ,@ks)))

