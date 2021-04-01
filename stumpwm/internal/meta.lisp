(defmacro strcon (&rest body)
  "Concatenate strings"
  `(concatenate 'string ,@body))

(defmacro shell-cmd-neol (cmd &key (prefix "") (affix ""))
  "Runs shell command and returns the result without the EOL.
Can be formatted with the :PREFIX and :AFFIX arguments."
  `(run-shell-command (strcon "echo -n " ,prefix "$(" ,cmd ")" ,affix) t))

(defun define-mult-keys (map list)
  (loop for (key . cmd) in list
     do (define-key map (kbd key) cmd)))

(defmacro inbtp (n min max)
  "``Does N fit in range (MIN; MAX)?'' predicate."
  `(and (>= ,n ,min)
        (<= ,n ,max)))

(defmacro defmap (name parent key)
  "Defines NAME map bound to the KEY under the PARENT map."
  `(progn (defparameter ,name (make-sparse-keymap))
          (define-key ,parent (kbd ,key) ,name)))
