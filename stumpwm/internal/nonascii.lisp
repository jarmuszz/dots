(defcommand nonascii/set-x-selection (str &key (selection :clipboard)) ((:string))
  (set-x-selection str selection)
  (message (strcon "Put `~a' into " (string selection) ".")  str))

(defmacro nonascii/bind (map &rest body)
  "Under MAP, binds CAR to putting CDR into clipboard for every set in
BODY."
  `(define-mult-keys ,map
       ',(loop for set in body
              collect (cons
                       (car set)
                       (strcon "nonascii/set-x-selection "
                               (cdr set))))))


;;; Root nonascii map
(defmap *nonascii/root-map* *root-map* "8")

;;; Minor nonascii modes
(defmap *nonascii/macron-map* *nonascii/root-map* "-")
(defmap *nonascii/umlaut-map* *nonascii/root-map* "\"")

(defun nonascii/init ()
  (nonascii/bind *nonascii/macron-map*
                 ("a" . "ā")
                 ("e" . "ē")
                 ("u" . "ū")
                 ("o" . "ō")
                 ("i" . "ī")
                 
                 ("A" . "Ā")
                 ("E" . "Ē")
                 ("U" . "Ū")
                 ("O" . "Ō")
                 ("I" . "Ī"))

  (nonascii/bind *nonascii/umlaut-map*
                 ("a" . "ä")
                 ("e" . "ë")
                 ("u" . "ü")
                 ("o" . "ö")
                 ("i" . "ï")
                 
                 ("A" . "Ä")
                 ("E" . "Ë")
                 ("U" . "Ü")
                 ("O" . "Ö")
                 ("I" . "Ï")))
