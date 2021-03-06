;;;; -*- Mode: lisp; indent-tabs-mode: nil -*-
;;;
;;; cffi-toolchain.asd --- ASDF system definition for cffi-toolchain.
;;;
;;; Copyright (C) 2007, Luis Oliveira  <loliveira@common-lisp.net>
;;;
;;; Permission is hereby granted, free of charge, to any person
;;; obtaining a copy of this software and associated documentation
;;; files (the "Software"), to deal in the Software without
;;; restriction, including without limitation the rights to use, copy,
;;; modify, merge, publish, distribute, sublicense, and/or sell copies
;;; of the Software, and to permit persons to whom the Software is
;;; furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be
;;; included in all copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;;; NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
;;; HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
;;; WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;;; DEALINGS IN THE SOFTWARE.
;;;

#-asdf3.1 (error "CFFI-toolchain requires ASDF 3.1!")

(defsystem "cffi-toolchain"
  :description "The CFFI toolchain"
  :long-description "Portable abstractions for using the C compiler, linker, etc."
  :author "Francois-Rene Rideau <fahree@gmail.com>"
  :depends-on ((:version "asdf" "3.1.2") "cffi")
  :licence "MIT"
  :components
  ((:module "toolchain"
    :serial t
    :components
    ((:file "package")
     (:file "asdf-compat" :if-feature (#.(if (version<= "3.1.6" (asdf-version)) :or :and)))
     (:file "c-toolchain")
     (:file "static-link")))))

;; vim: ft=lisp et
