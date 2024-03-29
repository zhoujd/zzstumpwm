;;;; keymap setting -*-lisp-*-
;;

(in-package :zwm)

;; multi key setting
(defun apply-keys-to-map (map key-pairs)
  "apply multi key defines"
  (do ((i 0 (+ i 2)))
      ((= i (length key-pairs)))
    (let ((key (nth i key-pairs))
          (fn (nth (1+ i) key-pairs)))
      (when fn
        (define-key map key fn)))))

;; change the prefix key to something else
;; stumpwm's default prefix key is C-t
(set-prefix-key (kbd "s-z"))

;; self define keymap
(defvar *zz-x-map*      (make-sparse-keymap) "Keymap like emacs C-x")
(defvar *zz-c-map*      (make-sparse-keymap) "Keymap like emacs C-c")
(defvar *zz-func-map*   (make-sparse-keymap) "Keymap function keys")
(defvar *zz-exec-map*   (make-sparse-keymap) "Keymap execute commands")
(defvar *zz-screen-map* (make-sparse-keymap) "Keymap screen")
(defvar *zz-menu-map*   (make-sparse-keymap) "Keymap menu")
(defvar *zz-help-map*   (make-sparse-keymap) "Keymap help")

(defmacro getkey-top (key)
  `(lookup-key *top-map* ,key))

(defmacro getkey-func (key)
  `(lookup-key *zz-func-map* ,key))

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-x")       *zz-x-map*
  (kbd "s-c")       *zz-c-map*
  (kbd "s-e")       *zz-exec-map*
  (kbd "s-f")       *zz-func-map*
  (kbd "s-s")       *zz-screen-map*
  (kbd "s-m")       *zz-menu-map*
  (kbd "s-?")       *zz-help-map*
  (kbd "s-r")       *root-map*
  (kbd "s-g")       *groups-map*
  ))

(mapc
 #'(lambda (map)
     (apply-keys-to-map
      map
      (list
       (kbd "C-g")  "abort"
       (kbd "ESC")  "abort"
       )))
 (list
  *zz-x-map*
  *zz-c-map*
  *zz-exec-map*
  *zz-func-map*
  *zz-screen-map*
  *zz-menu-map*
  *zz-help-map*
  *root-map*
  *groups-map*
  ))
