;;;; font setting -*-lisp-*-
;;

(in-package :zzwm)

(ignore-errors
  (require 'ttf-fonts)
  (or (and (xft:cache-fonts)
           (set-font (make-instance 'xft:font :family "WenQuanYi Zen Hei Mono" :subfamily "Medium" :size 15)))
      (set-font "10x20")))
