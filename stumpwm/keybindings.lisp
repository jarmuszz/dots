(define-mult-keys *top-map*
    '(("XF86AudioRaiseVolume" . "vol/up")
      ("XF86AudioLowerVolume" . "vol/down")
      ("XF86AudioMute"        . "vol/mute")
      ("XF86AudioMicMute"     . "vol/mic-mute")

      ("XF86MonBrightnessUp"   . "backlight/up")
      ("XF86MonBrightnessDown" . "backlight/down")))

(define-mult-keys *root-map*
    '(("SunPrint_Screen"   . "run-shell-command flameshot gui")
      ("s-SunPrint_Screen" . "run-shell-command xfce4-screenshooter")
      ("s-f"               . "fullscreen")
      ("s-t"               . "float-this")
      ("s-T"               . "unfloat-this")))


(define-mult-keys *launch-map*
    '(("f" . "run-shell-command firefox")
      ("g" . "run-shell-command gimp")
      ("t" . "run-shell-command teams")
      ("d" . "run-shell-command discord")
      
      ("b" . "books/open")
      ("p" . "prj/open")))


(define-mult-keys *edit-map*
    `(("s"   . ,(emacs-cmd "-e 'slime'"))
      ("d"   . ,(emacs-cmd "--no-splash --eval '(dired \".\" )'"))
      ("p"   . ,(emacs-cmd "--no-splash --eval '(dired \"~/prj\" )'"))
      ("o"   . ,(emacs-cmd "--no-splash ~/.cache/org/main.org"))
      ("c"   . ,(emacs-cmd "--no-splash ~/.config/stumpwm/config"))

      ("s-e" . ,(emacs-cmd))))
