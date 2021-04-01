;;; Edit map
(defmap *edit-map* *top-map* "s-e")

(defun emacs-cmd (&optional args)
  "Returns Stump command that runs emacs with
specified ARGS"
  (strcon "run-shell-command emacs " args))
;;; END of Edit map

;;; Launch map
(defmap *launch-map* *root-map* "a")
;;; END of Launch map
