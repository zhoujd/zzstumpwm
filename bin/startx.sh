#!/bin/sh

exec sbcl --eval '(ql:quickload :stumpwm)' \
          --eval '(ql:quickload :swank)'   \
          --eval '(stumpwm:stumpwm)'
