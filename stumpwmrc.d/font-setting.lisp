;;;; font setting -*-lisp-*-
;;

(in-package :stumpwm)

(xft:cache-fonts)

(require 'ttf-fonts)
(set-font (make-instance 'xft:font :family "Anonymous Pro" :subfamily "Regular" :size 13))
