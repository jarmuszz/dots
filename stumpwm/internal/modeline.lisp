;;; Bar'sx content
(defmacro modeline/shell-cmd (cmd &key (prefix "") (affix ""))
  "Runs SHELL-CMD-NEOL but wraps it into the '(:EVAL) which enables refreshing
in mode line. Takes the same arguments as SHELL-CMD-NEOL."
  `'(:eval (shell-cmd-neol ,cmd :prefix ,prefix :affix ,affix)))

(defun modeline/init-bar ()
  ;; Colors
  (load "~/.cache/wal/colors.lisp")
  (setf *mode-line-background-color* background)
  (setf *mode-line-border-color* background)
  (setf *mode-line-foreground-color* foreground)

  ;; Mode line's contents
  (setf *group-format* "%t")
  (setf *screen-mode-line-format*
        (list "| "
              "%g"
              " | "
              (modeline/shell-cmd "date +'%H:%M | %a %d'")
              " | "
              (modeline/shell-cmd "cat /sys/class/power_supply/BAT0/capacity"
                                  :prefix "b:"
                                  :affix "%")
              " | "
              (modeline/shell-cmd "amixer get Master | grep 'Front Left' | grep -o '[0-9]*%'"
                                  :prefix "a:")
              " | "
              (modeline/shell-cmd "mpc current -f '%artist% - %title%'")))

  ;; Refresh constantly
  (setf *mode-line-timeout* 1)

  ;; Start mode line
  (mode-line))
;;; END of Bar's content


;;; Bar click hook

;; '(( (x1 x2) cmd )
;;   ( (x1 x2) cmd )
;;   ...)
(defparameter modeline/click-actions
  '(( (175 232) "date"   )
    ( (232 297) "cal -m" )
    ( (297 355) "acpi"   )
    ( (355 413) "amixer" )))


(defun modeline/click-hook-handler (a b x y &key (action-list modeline/click-actions))
  "Runs commands when mode line is clicked in a specific range of X. When out
of defined ranges prints the X cord."
  (if (null action-list)
      (message "~a" x)
      (let ((x1  (car (car (car action-list))))
            (x2  (car (cdr (car (car action-list)))))
            (cmd (car (cdr (car action-list)))))
        (if (inbtp x x1 x2)
            (message
             (run-shell-command cmd t)) ; cmd
            (modeline/click-hook-handler a b x y
                                         :action-list (cdr action-list))))))

(defun modeline/init-hook ()
  (add-hook stumpwm:*mode-line-click-hook* 'modeline/click-hook-handler))
;;; END of Bar click hook

;;; Handler called in 
(defun modeline/init ()
  (modeline/init-bar)
  (modeline/init-hook))
