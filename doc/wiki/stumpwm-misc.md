Stumpwm Misc Setting
==================================

1. Font setting code sample

        (in-package :stumpwm)

        ;; set more for contrib tools 
        (set-contrib-dir (merge-pathnames (concat "stumpwmrc.d/stumpwm-contrib/")
                                  *zz-load-directory*))

        (load-module "ttf-fonts")

        (ignore-errors
            (or (and (xft:cache-fonts)
                (stumpwm:set-font (make-instance 'xft:font
                                                 :family    "Consolas"
                                                 :subfamily "Regular"
                                                 :size 12)))
        (set-font "-Consolas-normal-normal-normal-*-17-*-*-*-m-0-fontset-auto1")))


