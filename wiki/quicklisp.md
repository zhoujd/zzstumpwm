quicklisp package system
========================

1. Install quicklisp

        (setq qlqs-http:*proxy-url* "http://proxy-prc.*****.com:911")

2. Install system in quickliap

        (setq ql:*PROXY-URL* "http://proxy-prc.*****.com:911")
        (ql:update-all-dists)
        (ql:update-client)

3. Proxy in config

        echo "http://proxy-prc.*****.com:911" > quicklisp/config/proxy-url.txt

4. Useful commands

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

