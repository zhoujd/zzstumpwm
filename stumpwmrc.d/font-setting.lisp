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
 (and
  (xft:cache-fonts)
  (set-font (make-instance 'xft:font
                          :family "SF Mono SC"
                          :subfamily "Regular"
                          :size 11
                          :antialias t))))
