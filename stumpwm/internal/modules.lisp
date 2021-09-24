(load-module "swm-gaps")
(setf swm-gaps:*inner-gaps-size* 10)
(setf swm-gaps:*outer-gaps-size* 15)
(run-commands "toggle-gaps-on")

;; xft-font
;; git clone https://github.com/LispLima/clx-truetype ~/quicklisp/local-projects/clx-truetype
(ql:quickload "clx-truetype")
(load-module "ttf-fonts")

;; next thing is important (nothing else has worked for me)
(clx-truetype:cache-font-file "/usr/share/fonts/TTF/iosevka.ttf")

(set-font
 (make-instance 'xft:font
		:family "Iosevka"
		:subfamily "Regular"
		:size 11
		:antialias t))
