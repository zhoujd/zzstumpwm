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
(set-prefix-key (kbd "s-/"))

;; self define keymap
(defvar *zz-x-map*      (make-sparse-keymap) "Keymap like emacs C-x")
(defvar *zz-c-map*      (make-sparse-keymap) "Keymap like emacs C-c")
(defvar *zz-exec-map*   (make-sparse-keymap) "Keymap execute commands")
(defvar *zz-help-map*   (make-sparse-keymap) "Keymap help")
(defvar *zz-screen-map* (make-sparse-keymap) "Keymap screen")

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-x")       *zz-x-map*
  (kbd "s-c")       *zz-c-map*
  (kbd "s-e")       *zz-exec-map*
  (kbd "s-s")       *zz-screen-map*
  (kbd "s-?")       *zz-help-map*
  (kbd "s-z")       *root-map*
  (kbd "s-g")       *groups-map*
  ))

(mapc
 #'(lambda (map)
     (apply-keys-to-map
      map
      (list
       (kbd "C-g")  "abort"
       )))
 (list
  *zz-x-map*
  *zz-c-map*
  *zz-exec-map*
  *zz-screen-map*
  *zz-help-map*
  ))
