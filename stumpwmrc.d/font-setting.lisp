;;;; font setting -*-lisp-*-
;;tools: xlsfonts or xfontsel
;;find a font of your choice in `xfontsel' and put it here.
;(set-font "*-unifont-medium-*-normal-*-16-*-*-*-*-*-*-*")
;(setf xft:*font-dirs* '("/run/current-system/profile/share/fonts/"))
;(setf clx-truetype:+font-cache-filename+ (concat (getenv "HOME") "/.fonts/font-cache.sexp"))

(in-package :zwm)

;;default font
(set-font "12x24")

#-clx-truetype
(require 'clx-truetype)

#-ttf-fonts
(require 'ttf-fonts)

;;ttf font
(ignore-errors
 (set-font (make-instance 'xft:font
                          :family "WenQuanYi Micro Hei Mono"
                          :subfamily "Regular"
                          :size 12
                          :antialias t)))
