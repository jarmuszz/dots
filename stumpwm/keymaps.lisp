;;; Edit map
(defparameter *edit-map* (make-sparse-keymap))
(define-key *top-map* (kbd "s-e") *edit-map*)

(defun emacs-cmd (&optional args)
  "Returns stump command that runs emacs with
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
(defparameter *launch-map* (make-sparse-keymap))
(define-key *root-map* (kbd "a") *launch-map*)

(define-mult-keys *launch-map*
    '(("f" . "run-shell-command firefox")
      ("g" . "run-shell-command gimp")
      ("t" . "run-shell-command teams")
      ("d" . "run-shell-command discord")))
;;; END of Launch map
