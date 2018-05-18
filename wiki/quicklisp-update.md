For quicklisp update
==================================
M-x sbcl

(setq ql:*PROXY-URL* "http://proxy-prc.*****.com:911")
(ql:update-all-dists)
(ql:update-client)

