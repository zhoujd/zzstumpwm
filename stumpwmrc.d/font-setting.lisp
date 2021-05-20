;;;; font setting -*-lisp-*-
;;

(in-package :zzwm)

(ignore-errors
  (require 'ttf-fonts)
  (or (and (xft:cache-fonts)
           (set-font (make-instance 'xft:font :family "WenQuanYi Micro Hei Mono" :subfamily "Regular" :size 13)))
      (set-font "10x20")))
