;;; Volume controls
(defmacro define-vol (name device action)
  "Creates ``amixer set ...'' command."
  `(defcommand ,name () ((:string))
    (run-shell-command (strcon "amixer set "
                               ,device
                               " "
                               ,action))))

(defcommand vol/get () ((:string))
  "Returns current volume level"
  (shell-cmd-neol "amixer get Master | grep 'Front Left' | grep -o '[0-9]*%'"))

(define-vol vol/up       "Master"  "2%+ unmute")
(define-vol vol/down     "Master"  "2%- unmute")
(define-vol vol/mute     "Master"  "toggle")
(define-vol vol/mic-mute "Capture" "toggle")

(define-mult-keys *top-map*
    '(("XF86AudioRaiseVolume" . "vol/up")
      ("XF86AudioLowerVolume" . "vol/down")
      ("XF86AudioMute"        . "vol/mute")
      ("XF86AudioMicMute"     . "vol/mic-mute")))
;;; END of Volume controls


;;; Backlight
(defmacro define-backlight (name  action)
  "Creates ``xbacklight ...'' commands"
  `(defcommand ,name () ((:string))
    (run-shell-command (strcon "xbacklight " ,action))))

(define-backlight backlight/up "+5")
(define-backlight backlight/down "-5")

(define-mult-keys *top-map*
    '(("XF86MonBrightnessUp"   . "backlight/up")
      ("XF86MonBrightnessDown" . "backlight/down")))
;;; END of Backlight
