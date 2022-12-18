;;;; font setting -*-lisp-*-
;;tools: xlsfonts or xfontsel

(in-package :zwm)

;;find a font of your choice in `xfontsel' and put it here.
;(set-font "*-unifont-medium-*-normal-*-16-*-*-*-*-*-*-*")

#-clx-truetype
(require 'clx-truetype)

#-ttf-fonts
(require 'ttf-fonts)

(ignore-errors
 (or (and (xft:cache-fonts)
          (set-font (make-instance 'xft:font
                                   :family "WenQuanYi Micro Hei Mono"
                                   :subfamily "Regular"
                                   :size 12
                                   :antialias t)))
     (set-font "12x24")))
