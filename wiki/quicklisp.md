quicklisp package system
========================

## Install quicklisp

    (setq qlqs-http:*proxy-url* "http://proxy-prc.*****.com:911")

## Install system in quickliap

    (setq ql:*PROXY-URL* "http://proxy-prc.*****.com:911")
    (ql:update-client)
    (ql:update-all-dists)

## Proxy in config

    $ echo "http://proxy-prc.*****.com:911" > quicklisp/config/proxy-url.txt

## Useful commands

    (ql:update-client)
    (ql:update-dist "quicklisp")
    (ql:system-apropos "vector")
    (ql:quickload "quicklisp-slime-helper")
    (ql-dist:uninstall (ql-dist:release "babel"))
    (ql-dist:clean (ql-dist:dist "quicklisp"))
    (ql-dist:installed-releases (ql-dist:dist "quicklisp"))
    (ql:where-is-system "cl-ppcre")
    (ql:register-local-projects)
    (ql:dist-url "quicklisp")
    (ql:available-dist-versions "quicklisp")
    (ql:client-url)
    (ql:available-client-versions)


## Add custom local project

    ;; add config file
    $ cat  ~/.config/common-lisp/source-registry.conf.d/projects.conf <<EOF
    (:tree (:home "lisp/"))
    EOF

    or

    ;; startup file like ~/.sbclrc
    (pushnew (truename "~/path-to-project/root/") ql:*local-project-directories*)
    (ql:register-local-projects)
