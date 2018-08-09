;;;; font setting -*-lisp-*-
;;

(in-package :stumpwm)

(require 'ttf-fonts)

(ignore-errors
  (or (and (xft:cache-fonts)
           (set-font (make-instance 'xft:font :family "Anonymous Pro" :subfamily "Regular" :size 14)))
      (set-font "10x20")))
