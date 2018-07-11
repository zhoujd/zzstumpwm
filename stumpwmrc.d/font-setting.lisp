;;;; font setting -*-lisp-*-
;;

(in-package :stumpwm)

(require 'ttf-fonts)
(set-font (make-instance 'xft:font :family "Anonymous Pro" :subfamily "Regular" :size 13))
