;;;; keymap setting -*-lisp-*-
;;

(in-package :stumpwm)

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
(set-prefix-key (kbd "Menu"))

;; self define keymap
(defvar *zz-x-map*      (make-sparse-keymap) "Keymap like emacs C-x")
(defvar *zz-c-map*      (make-sparse-keymap) "Keymap like emacs C-c")
(defvar *zz-z-map*      (make-sparse-keymap) "Keymap like emacs C-z")
(defvar *zz-exec-map*   (make-sparse-keymap) "Keymap execute commands")
(defvar *zz-help-map*   (make-sparse-keymap) "Keymap help")
(defvar *zz-menu-map*   (make-sparse-keymap) "Keymap menu")
(defvar *zz-screen-map* (make-sparse-keymap) "Keymap screen")

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-t")       *root-map*
  (kbd "s-x")       *zz-x-map*
  (kbd "s-c")       *zz-c-map*
  (kbd "s-z")       *zz-z-map*
  (kbd "s-e")       *zz-exec-map*
  (kbd "s-h")       *zz-help-map*
  (kbd "s-m")       *zz-menu-map*
  (kbd "s-s")       *zz-screen-map*
  ))

(mapc
 #'(lambda (map)
     (apply-keys-to-map
      map
      (list
       (kbd "C-g") "abort")
      ))
 (list
  *zz-x-map*   
  *zz-c-map*   
  *zz-z-map*   
  *zz-exec-map*
  *zz-help-map*
  *zz-menu-map*
  *zz-screen-map*
  ))
