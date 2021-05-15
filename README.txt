Distro: Artix
WM:     CWM (Cum Window Manager)
Bar:    Lemonbar (cwm/cwmbar.sh)
Sh:     Bash
Term:   URxvt
Editor: Nvim
Font:   Iosevka (CWM), Hack (StumpWM)
-----------------------

Most of my CWM configs are placed into the source code directly. I
don't really use stumpwm now, I keep it here just so people may
get example config.

Recently I added my Noevim theme ("czarzly") to this repo. It's made
to work with terminal colors and has an additional highlighting for
OpenBSD style(9) C-like languages.

Unless stated otherwise, every file in this repository is under public
domain.

For screenshots look into the images/.


Old StumpWM README
-----------------------
`(,Macros hard)

Stumpwm config is based on the newest git version which may not be
compatible with the version from your pm so watch out. I'm nowhere
near a good lisp programmer so take that into the account when
browsing the repo. You shouldn't really just pull my config and use
it, it has some parts specific to my system and I'm writing it without
portability in mind. Also, my config will pull cl-fad from quicklisp
cuz I'm dumb.

