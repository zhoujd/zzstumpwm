;;;; key setting

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
(defvar *zz-exec-map*
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "f") "exec firefox")
    map)
  "Keymap for executing shell commands or switching to running applications.")

(defvar *zz-x-map*
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "1") "only")
    (define-key map (kbd "0") "remove")
    map)
  "Keymap simallar emacs C-x.")

(defvar *zz-window-map*
  (let ((map (make-sparse-keymap)))
    map)
  "Keymap window")

(defvar *zz-menu-map*
  (let ((map (make-sparse-keymap)))
    map)
  "Keymap menu")

(defvar *zz-view-map*
  (let ((map (make-sparse-keymap)))
    map)
  "Keymap view")

(defvar *zz-help-map*
  (let ((map (make-sparse-keymap)))
    map)
  "Keymap help")

;; top map
(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-e")       *zz-exec-map*
  (kbd "s-x")       *zz-x-map*
  (kbd "s-w")       *zz-window-map*
  (kbd "s-v")       *zz-view-map*
  (kbd "s-h")       *zz-help-map*

  (kbd "s-W")       "browse"
  (kbd "s-B")       "mode-line"
  (kbd "s-Tab")     "pull-hidden-next"  
  (kbd "Print")     "exec scrot -q 10"  
  (kbd "M-Print")   "exec scrot -q 10 -s"  
  
  (kbd "s-R")       "reinit"
  (kbd "s-Q")       "quit" 
  (kbd "s-F2")      "exec"  
  (kbd "s-F4")      "kill"  
  (kbd "s-F11")     "reboot"  
  (kbd "s-F12")     "halt" 
  
  (kbd "s-Right")   "move-focus right"  
  (kbd "s-Left")    "move-focus left"  
  (kbd "s-Up")      "move-focus up"  
  (kbd "s-Down")    "move-focus down" 
  
  (kbd "s-C-Right") "move-window right"  
  (kbd "s-C-Left")  "move-window left"  
  (kbd "s-C-Up")    "move-window up"  
  (kbd "s-C-Down")  "move-window down"  
  
  (kbd "s-S-Right") "gnext"
  (kbd "s-S-Left")  "gprev"  
  (kbd "s-S-Up")    "prev-in-frame"  
  (kbd "s-S-Down")  "next-in-frame"    
  ))

;; root map
(apply-keys-to-map
 *root-map*
 (list
  (kbd "s-`")       "windowlist"
  (kbd "s-I")       "display-current-window-info"
  ))
