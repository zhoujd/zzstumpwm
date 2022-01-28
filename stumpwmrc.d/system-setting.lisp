;;;; system setting -*-lisp-*-
;;

(in-package :zwm)

;; sudo command
(define-sudo-command reboot "reboot")
(define-sudo-command shutdown "shutdown -h now")
(define-sudo-command bright-setup (concat *zz-load-directory* "libexec/brightness-setup.sh"))

(defcommand reinit () ()
  "reload stumpwm configure"
  (run-commands "reload" "loadrc"))

;; ubuntu: sudo apt install acpi
;; arch: sudo pacman -S acpi
(defcommand show-battery () ()
  "show battery usage"
  (echo-string (current-screen) (run-shell-command "acpi" t)))

(defcommand uptime () ()
  "show uptime"
  (echo-string (current-screen) (run-shell-command "uptime" t)))

(defcommand bright-up () ()
  "brightness up"
  (run-shell-command
   (format nil "~a +5"
           (merge-pathnames "libexec/brightness" *zz-load-directory*))))

(defcommand bright-down () ()
  "brightness down"
  (run-shell-command
   (format nil "~a -5"
           (merge-pathnames "libexec/brightness" *zz-load-directory*))))

(defcommand pactl-up () ()
  "pactl sound up"
  (pactl-volume "+10%")
  (stumpwm::eval-command "pactl-status"))

(defcommand pactl-down () ()
  "pactl sound down"
  (pactl-volume "-10%")
  (stumpwm::eval-command "pactl-status"))

(defcommand pactl-inc () ()
  "pactl sound 100%"
  (pactl-volume "100%"))

(defcommand pactl-dec () ()
  "pactl sound 50%"
  (pactl-volume "50%"))

(defcommand pactl-status () ()
  "pactl status"
  (let ((cmd (format nil "~a vol status"
                     (merge-pathnames "bin/sndctl" *zz-load-directory*))))
    (message "~a" (run-shell-command cmd t))))

(defcommand pactl-toggle () ()
  "pactl sound toggle"
  (run-shell-command "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  (stumpwm::eval-command "pactl-status"))

(defcommand pactl-mic-up () ()
  "pactl mic sound up"
  (pactl-mic-volume "+10%")
  (stumpwm::eval-command "pactl-mic-status"))

(defcommand pactl-mic-down () ()
  "pactl mic sound down"
  (pactl-mic-volume "-10%")
  (stumpwm::eval-command "pactl-mic-status"))

(defcommand pactl-mic-status () ()
  "pactl mic status"
  (let ((cmd (format nil "~a mic status"
                     (merge-pathnames "bin/sndctl" *zz-load-directory*))))
    (message "~a" (run-shell-command cmd t))))

(defcommand pactl-mic-toggle () ()
  "pactl micphone toggle"
  (run-shell-command "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
  (stumpwm::eval-command "pactl-mic-status"))

(defcommand capslock-toggle () ()
  "capslock toggle"
  (run-shell-command "setcapslock toggle"))

;; showing and toggling the root window
(defvar *last-saved-window* nil
  "Last saved window configuration.")
(defcommand show-root () ()
  "Show root window."
  (when (cdr (stumpwm::group-frames (current-group)))
    ;; Make one frame if necessary.
    (stumpwm::only))
  (stumpwm::fclear))
(defcommand toggle-root () ()
  "Toggle between root window and last window configuration."
  (if (current-window)
      (progn
        (setf *last-saved-window* (stumpwm::dump-group (current-group)))
        (show-root))
      ;; Current window is root.
      (if *last-saved-window*
          (stumpwm::restore-group (current-group) *last-saved-window*)
          (stumpwm::echo "There is no saved window configuration yet."))))

(defcommand wifi-toggle () ()
  "wifi toggle"
  (message "~a"
           (run-shell-command
            (format nil "~a"
                    (merge-pathnames "libexec/wifi-toggle" *zz-load-directory*)) t)))

(defcommand touchpad-toggle () ()
  "touchpad toggle"
  (message "~a"
           (run-shell-command
            (format nil "~a"
                    (merge-pathnames "libexec/touchpad-toggle" *zz-load-directory*)) t)))

(defcommand touchpad-on () ()
  "touchpad toggle on"
  (message "~a"
           (run-shell-command
            (format nil "~a on"
                    (merge-pathnames "libexec/touchpad-toggle" *zz-load-directory*)) t)))

(defcommand touchpad-off () ()
  "touchpad toggle off"
  (message "~a"
           (run-shell-command
            (format nil "~a off"
                    (merge-pathnames "libexec/touchpad-toggle" *zz-load-directory*)) t)))

;; swap windows
(defcommand swap-windows () ()
  "swap 2 windows"
  (let* ((frames (stumpwm::group-frames (current-group)))
         (win (stumpwm::frame-window (car (last frames)))))
    (shift-windows-forward frames win)))

(defcommand safe-kill () ()
  "safe delete current window"
  (if (current-window)
      (let ((choice (yes-no-diag
                     (format nil "Close window: ~a?"
                             (stumpwm::window-name (current-window))))))
        (when choice
          (stumpwm::kill-window)))
      (message "Cannot close desktop!")))

(defcommand group-kill () ()
  "safe delete current group"
  (let* ((group (current-group))
         (screen (group-screen group))
         (choice (yes-no-diag
                  (format nil "Close group: ~a?"
                          (stumpwm::group-name group)))))
    (when choice
      (dolist (window (stumpwm::group-windows group))
        (stumpwm::delete-window window))
      (setf (screen-groups screen)
            (remove group (screen-groups screen))))))

(defcommand delete-group-windows () ()
  "close all group windows"
  (dolist (window (stumpwm::group-windows (current-group)))
    (stumpwm::delete-window window)))

(defcommand delete-all-windows () ()
  "close all windows"
  (dolist (screen *screen-list*)
    (dolist (group (stumpwm::screen-groups screen))
      (dolist (window (stumpwm::group-windows group))
        (stumpwm::delete-window window)))))

(defcommand safe-delete-windows () ()
  "safe delete all windows in current group"
    (let ((choice (yes-no-diag
                 (format nil "Close all programs in group: ~a?"
                         (stumpwm::group-name (current-group))))))
    (when choice
      (delete-group-windows))))

(defcommand safe-delete () ()
  "safe delete all windows"
  (let ((choice (yes-no-diag "Close all programs?")))
    (when choice
      (delete-all-windows))))

(defcommand safe-end () ()
  "safe end session"
  (delete-all-windows)
  (run-hook *quit-hook*))

(defcommand safe-quit () ()
  "safe quit"
  (let ((choice (yes-no-diag "Close all programs and quit stumpwm?")))
    (when choice
      (safe-end)
      (stumpwm::quit))))

(defcommand kill-stumpwm () ()
  "kill stumpwm"
  (let ((choice (yes-no-diag "Close all programs and kill stumpwm?")))
    (when choice
      (safe-end)
      (kill-ps "stumpwm"))))

(defcommand quit-window () ()
  "quit current window"
  (run-shell-command "xdotool getwindowfocus windowkill"))
