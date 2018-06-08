For quicklisp update
==================================
M-x sbcl

1. Install quicklisp

        (setq qlqs-http:*proxy-url* "http://proxy-prc.*****.com:911")

2. Install system in quickliap

        (setq ql:*PROXY-URL* "http://proxy-prc.*****.com:911")
        (ql:update-all-dists)
        (ql:update-client)

3. Proxy in config

        echo "http://proxy-prc.*****.com:911" > quicklisp/config/proxy-url.txt

