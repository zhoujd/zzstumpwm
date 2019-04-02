;;;; font setting -*-lisp-*-
;;

(in-package :stumpwm)

(ignore-errors
  (require 'ttf-fonts)
  (or (and (xft:cache-fonts)
           (set-font (make-instance 'xft:font :family "Anonymous Pro" :subfamily "Regular" :size 14)))
      (set-font "10x20")))
