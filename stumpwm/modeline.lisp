;;; Colors
(load "~/.cache/wal/colors.lisp")
(setf *mode-line-background-color* background)
(setf *mode-line-border-color* background)
(setf *mode-line-foreground-color* foreground)
;;; END of Colors

;;; Bar'sx content
(defmacro ml-shell-cmd (cmd &key (prefix "") (affix ""))
  "Runs shell-cmd-neol but wraps it into the '(:eval) which enables refreshing
in mode line. Takes the same arguments as shell-cmd-neol."
  `'(:eval (shell-cmd-neol ,cmd :prefix ,prefix :affix ,affix)))

(setf *group-format* "%t")
(setf *screen-mode-line-format*
      (list "| "
            "%g"
            " | "
            (ml-shell-cmd "date +'%H:%M | %a %d'")
            " | "
            (ml-shell-cmd "cat /sys/class/power_supply/BAT0/capacity"
                          :prefix "b:"
                          :affix "%")
            " | "
            (ml-shell-cmd "amixer get Master | grep 'Front Left' | grep -o '[0-9]*%'"
                          :prefix "a:")
            " | "
            ;(current-song)))
            (ml-shell-cmd "mpc current -f '%artist% - %title%'")))

(setf *mode-line-timeout* 1)

(mode-line)
;;; END of Bar's content


;;; Bar click hook
(defmacro shell-cmd-as-list (&rest cmd)
  "Wraps run-shell-command result into a single-atom list."
  `(list (run-shell-command ,@cmd t)))

;; Click hook
(defparameter ml-click-actions
  '(( (175 232) "date"   )
    ( (232 297) "cal -m" )
    ( (297 355) "acpi"   )
    ( (355 413) "amixer" )))


(defun ml-click-hook-handler (a b x y &key (action-list ml-click-actions))
  "Runs specific commands when mode line is clicked at specific X cord. When out
of defined ranges prints the X cord."
  (if (null action-list)
      (message "~a" x)
    (if (inbtp x
               (car (car (car action-list)))
               (car (cdr (car (car action-list)))))
        (message
         (run-shell-command (car (cdr (car action-list))) t))
      (ml-click-hook-handler a b x y
                           :action-list (cdr action-list)))))

(add-hook stumpwm:*mode-line-click-hook* 'ml-click-hook-handler)
;;; END of Bar click hook