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
(defvar *zz-f-map*      (make-sparse-keymap) "Keymap fn key")
(defvar *zz-exec-map*   (make-sparse-keymap) "Keymap execute commands")
(defvar *zz-help-map*   (make-sparse-keymap) "Keymap help")
(defvar *zz-screen-map* (make-sparse-keymap) "Keymap screen")

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-x")       *zz-x-map*
  (kbd "s-f")       *zz-f-map*
  (kbd "s-e")       *zz-exec-map*
  (kbd "s-h")       *zz-help-map*
  (kbd "s-s")       *zz-screen-map*

  (kbd "s-t")       *root-map*
  (kbd "s-g")       *groups-map*
  (kbd "s-w")       *group-root-map*
  ))

(mapc
 #'(lambda (map)
     (apply-keys-to-map
      map
      (list
       (kbd "C-g")  "abort")
      ))
 (list
  *zz-x-map*   
  *zz-f-map*   
  *zz-exec-map*
  *zz-help-map*
  *zz-screen-map*
  ))
