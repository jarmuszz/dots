(defun _nonascii/set-x-selection (str &key (selection :clipboard))
  "Copies STR into SELECTION."
  (set-x-selection str selection)
  (message (strcon "Put `~a' into " (string selection) ".")  str))

(defcommand nonascii/set-x-selection (str &key (selection :clipboard)) ((:string))
  "Command wrapper arround _NONASCII/SET-X-SELECTION."
  (_nonascii/set-x-selection str :selection selection))

(defmacro nonascii/rebind (map &rest body)
  "Under MAP, binds CAR to putting CDR into clipboard for every set in
BODY."
  `(define-mult-keys ,map
       ',(loop for set in body
              collect (cons
                       (car set)
                       (strcon "nonascii/set-x-selection "
                               (cdr set))))))

(defcommand nonascii/select-from-menu (list &key (prompt "Select: ")) ((:variable))
  (let ((str (cadr (select-from-menu (current-screen)
                                    (symbol-value list)
                                    prompt))))
    (if str (_nonascii/set-x-selection str))))

(defun nonascii/bind-assoc-menu (key list-symbol)
  (define-key *nonascii/root-map* (kbd key)
    (strcon "nonascii/select-from-menu " (string list-symbol))))

;;; Root nonascii map
(defmap *nonascii/root-map* *root-map* "8")

;;; Minor nonascii modes
(defmap *nonascii/macron-map* *nonascii/root-map* "-")
(defmap *nonascii/umlaut-map* *nonascii/root-map* "\"")

;; Maps for associative menus
(defparameter *nonascii/cyrlic-map*  ; Transcription is based on the polish phonology
  '(("a"    "а")
    ("b"    "б")
    ("w"    "в")
    ("g"    "г")
    ("d"    "д")
    ("je"   "е")
    ("jo"   "ё")
    ("ż"    "ж")
    ("z"    "з")
    ("i"    "и")
    ("j"    "й")
    ("k"    "к")
    ("ł/l"  "л")
    ("m"    "м")
    ("n"    "н")
    ("o"    "о")
    ("p"    "п")
    ("r"    "р")
    ("s"    "с")
    ("t"    "т")
    ("u"    "у")
    ("f"    "ф")
    ("ch"   "х")
    ("c"    "ц")
    ("cz"   "ч")
    ("sz"   "ш")
    ("szcz" "щ")
    ("jer"  "ъ")
    ("y"    "ы")
    (" ́jer" "ь")
    ("e"    "э")
    ("ju"   "ю")
    ("ja"   "я")

    ("A"    "А")
    ("B"    "Б")
    ("W"    "В")
    ("G"    "Г")
    ("D"    "Д")
    ("JE"   "Е")
    ("JO"   "Ё")
    ("Ż"    "Ж")
    ("Z"    "З")
    ("I"    "И")
    ("J"    "Й")
    ("K"    "К")
    ("Ł/L"  "Л")
    ("M"    "М")
    ("N"    "Н")
    ("O"    "О")
    ("P"    "П")
    ("R"    "Р")
    ("S"    "С")
    ("T"    "Т")
    ("U"    "У")
    ("F"    "Ф")
    ("CH"   "Х")
    ("C"    "Ц")
    ("CZ"   "Ч")
    ("SZ"   "Ш")
    ("SZCZ" "Щ")
    ("JER"  "Ъ")
    ("Y"    "Ы")
    (" ́JER" "Ь")
    ("E"    "Э")
    ("JU"   "Ю")
    ("JA"   "Я")))


(defun nonascii/init ()
  (nonascii/rebind *nonascii/macron-map*
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

  (nonascii/rebind *nonascii/umlaut-map*
                 ("a" . "ä")
                 ("e" . "ë")
                 ("u" . "ü")
                 ("o" . "ö")
                 ("i" . "ï")
                 
                 ("A" . "Ä")
                 ("E" . "Ë")
                 ("U" . "Ü")
                 ("O" . "Ö")
                 ("I" . "Ï"))
  
  ;;            Note the quote ─┐
  ;;                            v
  (nonascii/bind-assoc-menu "c" '*nonascii/cyrlic-map*))
