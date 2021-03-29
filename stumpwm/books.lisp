(loadconf "fuzzy.lisp")

;; Program to open files in
(defparameter books/default-program "zathura")
(defparameter books/default-dir     "/home/jarmusz/docs/books")

(defcommand books/open () ((:string))
  (fuzzy/to-program books/default-program books/default-dir))

(define-key *launch-map* (kbd "b") "books/open")
