;;;; font setting -*-lisp-*-
;;xlsfonts

(in-package :zwm)

(require 'clx-truetype)
(require 'ttf-fonts)
(ignore-errors
 (or (and (xft:cache-fonts)
          (set-font (make-instance 'xft:font
                                   :family "WenQuanYi Micro Hei Mono"
                                   :subfamily "Regular"
                                   :size 12
                                   :antialias t)))
     (set-font "12x24")))
