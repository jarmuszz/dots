(defvar remap/emacs-keymap
  '(("C-n"    . "Down")
    ("C-p"    . "Up")
    ("C-f"    . "Right")
    ("C-b"    . "Left")
    ("C-e"    . "End")
    ("C-a"    . "Home")
    ("M-b"    . "C-Left")
    ("M-f"    . "C-Right")
    ("C-F"    . "S-Right")
    ("C-B"    . "S-Left")
    ("M-F"    . "S-C-Right")
    ("M-B"    . "S-C-Left")
    ("S-C-e"  . "S-End")
    ("S-C-a"  . "S-Home")
    ("M-a"    . "C-a")
    ("C-v"    . "Next")
    ("M-v"    . "Prior")
    ("M-w"    . "C-c")
    ("C-w"    . "C-x")
    ("C-y"    . "C-v")
    ("M-<"    . "C-Home")
    ("M->"    . "C-End")
    ("M-b"    . "C-Left")
    ("M-f"    . "C-Right")
    ("C-s"    . "C-f")
    ("C-g"    . "Escape")
    ("C-/"    . "C-z")
    ("C-r"    . "C-y")
    ("C-k"    . ("S-End" "C-x"))))

(defmacro remap/new (body &key (emacs nil))
  ``(,(lambda (win)
        (string-equal (window-class win) ,(car body)))
      ,@(append ',(cdr body)
                (if ,emacs
                    remap/emacs-keymap
                    nil))))

(define-remapped-keys
    `( ,(remap/new ("Discord"
                    ("C-x" . "C-k"))
                   :emacs t)

       ,(remap/new ("Firefox"
                    ("C-1"   . "C-b")     ; Bookmarks
                    ("C-2"   . "C-h")     ; History menu
                    ("C-N"   . "C-]")     ; History - forward
                    ("C-P"   . "C-[")     ; Hsitory - back
                    ("C-M-n" . "C-Next")  ; Prior Tab
                    ("C-M-p" . "C-Prior") ; Next Tab
                    ("C-x"   . "F6")      ; URL bar
                    ("C-M-i" . "C-P")   ; Private tab
                    ("C-M-t" . "C-w"))    ; Close a tab
                   :emacs t)))
