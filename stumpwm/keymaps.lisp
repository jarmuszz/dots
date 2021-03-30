(defmacro defmap (name parent key)
  "Defines NAME map bound to the KEY under the PARENT map."
  `(progn (defparameter ,name (make-sparse-keymap))
          (define-key ,parent (kbd ,key) ,name)))

;;; Edit map
(defmap *edit-map* *top-map* "s-e")

(defun emacs-cmd (&optional args)
  "Returns Stump command that runs emacs with
specified ARGS"
  (strcon "run-shell-command emacs " args))

(define-mult-keys *edit-map*
    `(("s"   . ,(emacs-cmd "-e 'slime'"))
      ("d"   . ,(emacs-cmd "--no-splash --eval '(dired \".\" )'"))
      ("p"   . ,(emacs-cmd "--no-splash --eval '(dired \"~/prj\" )'"))
      ("o"   . ,(emacs-cmd "--no-splash ~/.cache/org/main.org"))
      ("c"   . ,(emacs-cmd "--no-splash ~/.config/stumpwm/config"))

      ("s-e" . ,(emacs-cmd))))

;;; END of Edit map


;;; Launch map
(defmap *launch-map* *root-map* "a")

(define-mult-keys *launch-map*
    '(("f" . "run-shell-command firefox")
      ("g" . "run-shell-command gimp")
      ("t" . "run-shell-command teams")
      ("d" . "run-shell-command discord")))
;;; END of Launch map
