;;;; Group keys setting -*-lisp-*-
;;

(in-package :zwm)


(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-Left")            "move-float-window -10 0"
  (kbd "s-Right")           "move-float-window +10 0"
  (kbd "s-Up")              "move-float-window 0 -10"
  (kbd "s-Down")            "move-float-window 0 +10"
  ))

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-M-Left")          "resize-float-window -10 0"
  (kbd "s-M-Right")         "resize-float-window +10 0"
  (kbd "s-M-Up")            "resize-float-window 0 -10"
  (kbd "s-M-Down")          "resize-float-window 0 +10"
  ))

(apply-keys-to-map
 *top-map*
 (list
  (kbd "s-C-Left")          "float-window-gravity left"
  (kbd "s-C-Right")         "float-window-gravity right"
  (kbd "s-C-Up")            "float-window-gravity top"
  (kbd "s-C-Down")          "float-window-gravity bottom"
  ))
