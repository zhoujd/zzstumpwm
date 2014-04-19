;;;; common setting

(in-package :stumpwm)

(require 'swank)
(swank:create-server :dont-close t)

;; change the prefix key to something else
(set-prefix-key (kbd "s-z"))

(set-fg-color "green")  
(set-bg-color "black")

