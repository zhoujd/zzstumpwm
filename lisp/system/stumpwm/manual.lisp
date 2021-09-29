;; Copyright (C) 2007-2008 Shawn Betts
;;
;;  This file is part of stumpwm.
;;
;; stumpwm is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; stumpwm is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this software; see the file COPYING.  If not, see
;; <http://www.gnu.org/licenses/>.

;; Commentary:
;;
;; Generate the texinfo manual from docstrings in the source.
;;
;; Code:

(in-package #:stumpwm)

(require :sb-introspect)

(defun generate-function-doc (s line)
  (ppcre:register-groups-bind (name) ("^@@@ (.*)" line)
    (let ((fn-name (with-standard-io-syntax
                     (let ((*package* (find-package :stumpwm)))
                       (read-from-string name)))))
      (if (fboundp fn-name)
          (let ((fn (fdefinition fn-name))
                (*print-pretty* nil))
            (format s "@defun {~A} ~{~A~^ ~}~%~A~&@end defun~%~%"
                    name
                    (sb-introspect:function-lambda-list fn)
                    (documentation fn 'function)))
          (warn "Function ~A not found." fn-name)))))

(defun generate-macro-doc (s line)
  (ppcre:register-groups-bind (name) ("^%%% (.*)" line)
                              (let* ((symbol (find-symbol (string-upcase name) :stumpwm))
                                     (*print-pretty* nil))
                                (format s "@defmac {~a} ~{~a~^ ~}~%~a~&@end defmac~%~%"
                                        name
                                        (sb-introspect:function-lambda-list (macro-function symbol))
                                        (documentation symbol 'function))
                                t)))

(defun generate-variable-doc (s line)
  (ppcre:register-groups-bind (name) ("^### (.*)" line)
                              (let ((sym (find-symbol (string-upcase name) :stumpwm)))
                                (format s "@defvar ~a~%~a~&@end defvar~%~%"
                                        name (documentation sym 'variable))
                                t)))

(defun generate-hook-doc (s line)
  (ppcre:register-groups-bind (name) ("^\\$\\$\\$ (.*)" line)
                              (let ((sym (find-symbol (string-upcase name) :stumpwm)))
                                (format s "@defvr {Hook} ~a~%~a~&@end defvr~%~%"
                                        name (documentation sym 'variable))
                                t)))

(defun generate-command-doc (s line)
  (ppcre:register-groups-bind (name) ("^!!! (.*)" line)
    (if-let (symbol (find-symbol (string-upcase name) :stumpwm))
      (let ((cmd (symbol-function symbol))
            (*print-pretty* nil))
        (format s "@deffn {Command} ~a ~{~a~^ ~}~%~a~&@end deffn~%~%"
                name
                (sb-introspect:function-lambda-list cmd)
                (documentation cmd 'function))
        t)
      (warn "Symbol ~A not found in package STUMPWM" name))))

(defun generate-manual (&key (in #p"stumpwm.texi.in") (out #p"stumpwm.texi"))
  (let ((*print-case* :downcase))
    (with-open-file (os out :direction :output :if-exists :supersede)
      (with-open-file (is in :direction :input)
        (loop for line = (read-line is nil is)
              until (eq line is) do
              (or (generate-function-doc os line)
                  (generate-macro-doc os line)
                  (generate-hook-doc os line)
                  (generate-variable-doc os line)
                  (generate-command-doc os line)
                  (write-line line os)))))))
