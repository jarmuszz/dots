;(load-file "~/.config/emacs/plugins.el")


;(org-babel-load-file (concat user-emacs-directory "conf.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("13ecdba8b8bdc126393c1a389b7b3e411e8ae3f8948ddabd160ebfa0501d728c" "ea6fd1ecc660fb434e19ed6b6d193bd25670bfcb6a955dfa21662da90184ba0c" "dea5507be295b466872240242614832e37136a0941e7253062dfe3834953de0d" "e5c9860ef1654cd06ffb867265707e63d0dbf10ea1fce7654dd031ab634fd130" "5438b78519e0c13b30b702e91d4728e3955f06c48c5aa6d01a2db1d5df30ed78" "33e14d83fc4864f66c0eb12bffc54743950e99aed3f0f8e3ab5e6312bc2c5086" "4d16802de4686030ed8f30b5a844713d68edec9cc07322bef54493d15e68d8cd" "5034d4b3ebd327bbdc1bbf925b6bf7e4dfbe4f3f84ee4d21e154143f128c6e04" "6454421996f0508c38215a633256e36c19a28591542fb0946cfc40f1dceb89cf" "f0eb51d80f73b247eb03ab216f94e9f86177863fb7e48b44aacaddbfe3357cf1" "281904c0e4ef7e2e36d0433c2d28b9b46bcc173f00b563a163256ae3e543c33c" "e9aa348abd3713a75f2c5ba279aa581b1c6ec187ebefbfa33373083ff8004c7c" default))
 '(ispell-dictionary nil)
 '(minimap-mode t)
 '(minimap-window-location 'right)
 '(safe-local-variable-values
   '((eval ispell-change-dictionary "polish")
     (eval ispell-change-dictionary "american"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-font-face ((t (:height 36 :family "Terminus (TTF)")))))

(load-file  (concat user-emacs-directory "conf.el"))
