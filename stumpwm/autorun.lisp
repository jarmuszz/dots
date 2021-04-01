(loadconf "internal/modules.lisp")

(remap/init)
(modeline/init)
(nonascii/init)
(visual/init)

(mapc #'run-shell-command
      '("picom"
        "wal -R"
        ))
