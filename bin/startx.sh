#!/bin/sh

exec sbcl --eval '(ql:quickload :stumpwm)' \
          --eval '(stumpwm:stumpwm)'
