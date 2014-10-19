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
(set-prefix-key (kbd "s-t"))

;; self define keymap
(defvar *zz-x-map*      (make-sparse-keymap) "Keymap simallar emacs C-x.")
(defvar *zz-c-map*      (make-sparse-keymap) "Keymap simallar emacs C-c.")
(defvar *zz-exec-map*   (make-sparse-keymap) "Keymap execute commands.")
(defvar *zz-window-map* (make-sparse-keymap) "Keymap window")
(defvar *zz-menu-map*   (make-sparse-keymap) "Keymap menu")
(defvar *zz-view-map*   (make-sparse-keymap) "Keymap view")
(defvar *zz-help-map*   (make-sparse-keymap) "Keymap help")

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-x")       *zz-x-map*
  (kbd "s-c")       *zz-c-map*
  (kbd "s-e")       *zz-exec-map*
  (kbd "s-w")       *zz-window-map*
  (kbd "s-v")       *zz-view-map*
  (kbd "s-h")       *zz-help-map*
  ))
