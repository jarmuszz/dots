(loadconf "fuzzy.lisp")

(defparameter prj/base-dir "~/prj")
(defparameter prj/dirs (alexandria:flatten
                        (loop for dir in (cl-fad:list-directory prj/base-dir)
                           collect (cl-fad:list-directory dir))))

(defcommand prj/open () ((:string))
            (fuzzy/open-in-directory '("xterm" "emacs") prj/dirs))

(define-key *launch-map* (kbd "p") "prj/open")
