(ql:quickload "cl-fad")

(defun fuzzy/to-program (program directory &key (prompt "Select"))
 "Displays menu with files from DIRECTORY for user to select. Selected
file will be opened in PROGRAM."
 (let ((file (car (select-from-menu
                   (current-screen)
                   `(,@(loop for f in (cl-fad:list-directory directory)
                          collect (strcon (pathname-name f)
                                          (let ((ftype (pathname-type f)))
                                            (if (stringp ftype)
                                                (strcon "." ftype)
                                                "")))))
                   prompt))))
   (if file
       (run-shell-command
        (strcon program   " \""
                (namestring (cl-fad:pathname-as-directory directory))
                file
                "\"")))))
