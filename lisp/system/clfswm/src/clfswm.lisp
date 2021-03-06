;;; --------------------------------------------------------------------------
;;; CLFSWM - FullScreen Window Manager
;;;
;;; --------------------------------------------------------------------------
;;; Documentation: Main functions
;;; --------------------------------------------------------------------------
;;;
;;; (C) 2012 Philippe Brochard <pbrochard@common-lisp.net>
;;;
;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
;;;
;;; --------------------------------------------------------------------------

(in-package :clfswm)


(define-handler main-mode :key-press (code state)
  (funcall-key-from-code *main-keys* code state))

(define-handler main-mode :button-press (code state window root-x root-y)
  (unless (funcall-button-from-code *main-mouse* code state window root-x root-y *fun-press*)
    (replay-button-event)))

(define-handler main-mode :button-release (code state window root-x root-y)
  (unless (funcall-button-from-code *main-mouse* code state window root-x root-y *fun-release*)
    (replay-button-event)))

(define-handler main-mode :motion-notify (window root-x root-y)
  (unless (compress-motion-notify)
    (funcall-button-from-code *main-mouse* 'motion
			      (modifiers->state *default-modifiers*)
			      window root-x root-y *fun-press*)))


(define-handler main-mode :configure-request (stack-mode window x y width height border-width value-mask)
  (let ((change nil))
    (labels ((has-x (mask) (= 1 (logand mask 1)))
             (has-y (mask) (= 2 (logand mask 2)))
             (has-w (mask) (= 4 (logand mask 4)))
             (has-h (mask) (= 8 (logand mask 8)))
             (has-bw (mask) (= 16 (logand mask 16)))
             (has-stackmode (mask) (= 64 (logand mask 64)))
             (adjust-from-request ()
               (when (has-x value-mask) (setf (x-drawable-x window) x
                                              change :moved))
               (when (has-y value-mask) (setf (x-drawable-y window) y
                                              change :moved))
               (when (has-h value-mask) (setf (x-drawable-height window) height
                                              change :resized))
               (when (has-w value-mask) (setf (x-drawable-width window) width
                                              change :resized))))
      (when window
        (xlib:with-state (window)
          (let ((current-root (find-current-root)))
            (if (find-child window current-root)
                (let ((parent (find-parent-frame window current-root)))
                  (if (and parent (managed-window-p window parent))
                      (setf change (adapt-child-to-parent window parent))
                      (adjust-from-request)))
                (adjust-from-request)))
          (when (has-bw value-mask)
            (setf (x-drawable-border-width window) border-width
                  change :resized))
          (when (has-stackmode value-mask)
            (case stack-mode
              (:above
               (unless (null-size-window-p window)
                 (when (or (child-equal-p window (current-child))
                           (is-in-current-child-p window))
                   (setf change (or change :moved))
                   (raise-window window)
                   (focus-window window)
                   (focus-all-children window (find-parent-frame window (find-current-root)))))))))
        (unless (eq change :resized)
          ;; To be ICCCM compliant, send a fake configuration notify event only when
          ;; the window has moved and not when it has been resized or the border width has changed.
          (send-configuration-notify window (x-drawable-x window) (x-drawable-y window)
                                     (x-drawable-width window) (x-drawable-height window)
                                     (x-drawable-border-width window)))))))


(define-handler main-mode :map-request (window send-event-p)
  (unless send-event-p
    (unless (find-child window *root-frame*)
      (unhide-window window)
      (process-new-window window)
      (map-window window)
      (unless (null-size-window-p window)
        (multiple-value-bind (never-managed raise)
            (never-managed-window-p window)
          (unless (and never-managed raise)
            (show-all-children)))))))



(define-handler main-mode :unmap-notify (send-event-p event-window window)
  (unless (and (not send-event-p)
	       (not (xlib:window-equal window event-window)))
    (when (find-child window *root-frame*)
      (setf (window-state window) +withdrawn-state+)
      (xlib:unmap-window window)
      (remove-child-in-all-frames window)
      (unless (null-size-window-in-frame *root-frame*)
        (show-all-children)))))





(define-handler main-mode :destroy-notify (send-event-p event-window window)
  (unless (or send-event-p
	      (xlib:window-equal window event-window))
    (when (find-child window *root-frame*)
      (delete-child-in-all-frames window)
      (unless (null-size-window-in-frame *root-frame*)
        (show-all-children))
      (xlib:destroy-window window))))

(define-handler main-mode :enter-notify  (window root-x root-y)
  (unless (and (> root-x (- (xlib:screen-width *screen*) 3))
	       (> root-y (- (xlib:screen-height *screen*) 3)))
    (case (if (frame-p (current-child))
	      (frame-focus-policy (current-child))
	      *default-focus-policy*)
      (:sloppy (focus-window window))
      (:sloppy-strict (when (and (frame-p (current-child))
				 (child-member window (frame-child (current-child))))
			(focus-window window)))
      (:sloppy-select (let* ((child (find-child-under-mouse root-x root-y))
			     (parent (find-parent-frame child)))
			(unless (or (child-root-p child)
				    (equal (typecase child
				    	     (xlib:window parent)
					     (t child))
					   (current-child)))
			    (focus-all-children child parent)
			    (show-all-children)))))))

(define-handler main-mode :exposure (window)
  (awhen (find-frame-window window)
    (display-frame-info it)))


(define-handler main-mode :configure-notify (window)
  (when (child-equal-p window *root*)
    (unless (null-size-window-in-frame *root-frame*)
      (unless (eql (place-frames-from-xinerama-infos) :update)
        (finish-configuring-root))
      (show-all-children)
      (call-hook *root-size-change-hook*))))


(defun error-handler (display error-key &rest key-vals &key asynchronous &allow-other-keys)
  "Handle X errors"
  (cond
    ;; ignore asynchronous window errors
    ((and asynchronous
          (find error-key '(xlib:window-error xlib:drawable-error xlib:match-error)))
     #+:xlib-debug (format t "~&Ignoring XLib asynchronous error: ~s~%" error-key))
    ((eq error-key 'xlib:access-error)
     (write-line "~&Another window manager is running.")
     (throw 'exit-clfswm nil))
    ;; all other asynchronous errors are printed.
    (asynchronous
     #+:xlib-debug (format t "~&Caught Asynchronous X Error: ~s ~s" error-key key-vals))
    ;;((find error-key '(xlib:window-error xlib:drawable-error xlib:match-error))
    ;; (format t "~&Ignoring Xlib error: ~S ~S~%" error-key key-vals))
    (t
     (apply 'error error-key :display display :error-key error-key key-vals))))


(defun main-loop ()
  (loop
     (with-xlib-protect (:main-loop nil)
       (call-hook *loop-hook*)
       (process-timers)
       (when (xlib:event-listen *display* *loop-timeout*)
         (xlib:process-event *display* :handler #'handle-event))
       (xlib:display-finish-output *display*)
       (setf *x-error-count* 0))))




(defun open-display (display-str protocol)
  (multiple-value-bind (host display-num) (parse-display-string display-str)
    (setf *display* (xlib:open-display host :display display-num :protocol protocol)
	  (xlib:display-error-handler *display*) 'error-handler
	  (getenv "DISPLAY") display-str)))



(defun default-init-hook ()
  (place-frames-from-xinerama-infos)
  (finish-configuring-root))


(defun init-display ()
  (reset-root-list)
  (reset-last-head-size)
  (reset-bind-or-jump-slots)
  (reset-open-menu)
  (fill-handle-event-fun-symbols)
  (assoc-keyword-handle-event 'main-mode)
  (setf *screen* (first (xlib:display-roots *display*))
	*root* (xlib:screen-root *screen*)
	*no-focus-window* (xlib:create-window :parent *root* :x 0 :y 0 :width 1 :height 1)
	*default-font* (xlib:open-font *display* *default-font-string*)
	*pixmap-buffer* (xlib:create-pixmap :width (xlib:screen-width *screen*)
					    :height (xlib:screen-height *screen*)
					    :depth (xlib:screen-root-depth *screen*)
					    :drawable *root*)
	*in-second-mode* nil
        *x-error-count* 0)
  (store-root-background)
  (init-modifier-list)
  (xgrab-init-pointer)
  (xgrab-init-keyboard)
  (init-last-child)
  (call-hook *binding-hook*)
  (clear-timers)
  (map-window *no-focus-window*)
  (dbg *display*)
  (setf (xlib:window-event-mask *root*) (xlib:make-event-mask :substructure-redirect
							      :substructure-notify
                                                              :structure-notify
							      :property-change
                                                              ;;:resize-redirect
							      :exposure
							      :button-press
							      :button-release
							      :pointer-motion))
  (xlib:display-finish-output *display*)
  ;;(intern-atoms *display*)
  (netwm-set-properties)
  (xlib:display-force-output *display*)
  (setf *child-selection* nil)
  (setf *root-frame* (create-frame :name "Root" :number 0)
	(current-child) *root-frame*)
  (call-hook *init-hook*)
  (process-existing-windows *screen*)
  (show-all-children)
  (grab-main-keys)
  (xlib:display-finish-output *display*)
  (optimize-event-hook))




(defun read-conf-file ()
  (let* ((conf (conf-file-name)))
    (if conf
	(handler-case (load conf)
	  (error (c)
	    (format t "~2%*** Error loading configuration file: ~A ***~&~A~%" conf c)
	    (values nil (format nil "~s" c) conf))
	  (:no-error (&rest args)
	    (declare (ignore args))
	    (values t nil conf)))
	(values t nil nil))))






(defun exit-clfswm ()
  "Exit clfswm"
  (throw 'exit-clfswm nil))

(defun reset-clfswm ()
  "Reset clfswm"
  (throw 'exit-main-loop nil))




(defun main-unprotected (&key (display (or (getenv "DISPLAY") ":0")) protocol
			 (read-conf-file-p t) (alternate-conf nil)
			 error-msg)
  (conf-file-name alternate-conf)
  (when read-conf-file-p
    (read-conf-file))
  (create-configuration-menu :clear t)
  (call-hook *main-entrance-hook*)
  (handler-case
      (open-display display protocol)
    (xlib:access-error (c)
      (format t "~&~A~&Maybe another window manager is running. [1]~%" c)
      (force-output)
      (exit-clfswm)))
  (handler-case
      (init-display)
    (xlib:access-error (c)
      (ungrab-main-keys)
      (xlib:destroy-window *no-focus-window*)
      (xlib:close-display *display*)
      (format t "~&~A~&Maybe another window manager is running. [2]~%" c)
      (force-output)
      (exit-clfswm)))
  (when error-msg
    (info-mode error-msg))
  (catch 'exit-main-loop
      (unwind-protect
	   (main-loop)
        (progn
          (ungrab-main-keys)
          (xlib:destroy-window *no-focus-window*)
          (xlib:free-pixmap *pixmap-buffer*)
          (destroy-all-frames-window)
          (call-hook *close-hook*)
          (clear-event-hooks)
          (xlib:close-display *display*)
          #+:event-debug
          (format t "~2&Unhandled events: ~A~%" *unhandled-events*)))))



(defun main (&key (display (or (getenv "DISPLAY") ":0")) protocol
	     (read-conf-file-p t)
	     (alternate-conf nil))
  (let (error-msg)
    (catch 'exit-clfswm
      (loop
	 (handler-case
	     (if *other-window-manager*
		 (run-other-window-manager)
		 (main-unprotected :display display :protocol protocol
				   :read-conf-file-p read-conf-file-p
				   :alternate-conf alternate-conf
				   :error-msg error-msg))
	   (error (c)
	     (let ((msg (format nil "CLFSWM Error: ~A." c)))
	       (format t "~&~A~%Reinitializing...~%" msg)
	       (setf error-msg (list (list msg *info-color-title*)
				     "Reinitializing...")))))))))



