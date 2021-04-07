(defparameter fuzzy/home-dir (namestring (user-homedir-pathname)))

(defun fuzzy/to-program (program directory &key (prompt "Select: "))
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

   (if file (run-shell-command
             (strcon program   " \""
                     (namestring (cl-fad:pathname-as-directory directory))
                     file
                     "\"")))))

(defun fuzzy/open-in-directory (programs directories &key (prompt "Select: "))
  "Displays menu with DIRECTORIES for user to select. In selected
directory PROGRAMS will be launched."
  (let ((directory (car (select-from-menu
                         (current-screen)
                         `(,@(loop for dir in directories
                                collect (if (pathnamep dir)
                                            (namestring dir)
                                            dir)))
                         prompt))))

    (if directory
        (progn
          (sb-posix:chdir directory)
          (loop for prog in programs
             do (run-shell-command prog))))
    (sb-posix:chdir fuzzy/home-dir)))
