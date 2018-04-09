
(in-package :stumpwm)


(defparameter *saved-screen* (make-hash-table :test #'equal))

(defstruct save-screen frame-tree frame-hash current-frame)
(defstruct save-frame focus window-list)

(defun copy-screen-frame-tree (tree)
  (tree-accum-fn tree #'list #'copy-structure))



(defun save-screen-layout (screen name)
  "Save screen layout (ie: screen frame tree, frames numbers and windows numbers
   in each frames and current frame)"
  (let ((saved (make-save-screen :frame-tree
                                 (copy-screen-frame-tree (screen-frame-tree screen))
                                 :frame-hash (make-hash-table)
                                 :current-frame
                                 (frame-number (screen-current-frame screen)))))
    (dolist (f (screen-frames screen))
      (setf (gethash (frame-number f) (save-screen-frame-hash saved))
            (make-save-frame :focus (and (frame-window f)
                                         (window-number (frame-window f)))
                             :window-list nil))
      (dolist (w (frame-windows screen f))
        (push (window-number w)
              (save-frame-window-list (gethash (frame-number f)
                                               (save-screen-frame-hash saved))))))
    (setf (gethash name *saved-screen*) saved)))


(defun restore-screen-layout (screen name)
  "Restore screen layout and focus the currennt frame in the saved screen"
  (labels ((find-frame (frame-number)
             (find-if (lambda (x)
                        (= frame-number (frame-number x)))
                      (screen-frames screen)))
           (find-window (window-number)
             (find-if (lambda (x)
                        (= window-number (window-number x)))
                      (screen-mapped-windows screen))))
    (let ((saved (gethash name *saved-screen*)))
      (when saved
        (setf (screen-frame-tree screen)
              (copy-screen-frame-tree (save-screen-frame-tree saved)))
        ;; Absorb all windows (even new windows)
        (let ((default-frame (first (screen-frames screen))))
          (dolist (win (screen-mapped-windows screen))
            (setf (window-frame screen win) default-frame)))
        ;; Restore windows by numbers in frames
        (maphash (lambda (frame-number save-frame)
                   (let ((frame (find-frame frame-number)))
                     (unless (member (frame-window frame) (screen-mapped-windows screen))
                       (setf (frame-window frame) nil))
                     (dolist (w (save-frame-window-list save-frame))
                       (let ((win (find-window w)))
                         (when win
                           (setf (window-frame screen win) frame))))
                     (when (save-frame-focus save-frame)
                       (let ((win (find-window (save-frame-focus save-frame))))
                         (when win
                           (setf (frame-window frame) win)
                           (frame-raise-window screen frame win))))
                     (sync-frame-windows screen frame)))
                 (save-screen-frame-hash saved))
        (when (save-screen-current-frame saved)
          (focus-frame screen (find-frame (save-screen-current-frame saved))))))))
    

(define-stumpwm-command "save-layout" (screen (name :string "Save layout in: "))
  (save-screen-layout screen name))

(define-stumpwm-command "restore-layout" (screen (name :string "Restore layout from: "))
  (restore-screen-layout screen name))

;;(define-key *root-map* (kbd "i")   "restore-layout")
;;(define-key *root-map* (kbd "C-i") "save-layout")
