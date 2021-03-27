[ "$UID" -eq "0" ] && export PS1="# " || export PS1="% "

#export QT_QPA_PLATFORMTHEME=qt5ct

shopt -s autocd

export WINEPREFIX=~/.cache/wine

alias sudo="doas"

alias e="emacs -nw"
alias se="sudo emacs -nw"
alias v="vim"
alias vs="sudo vim"
alias cl="clisp"
alias rsbcl="rlwrap sbcl"
alias p="pacman"
alias sp="sudo pacman"
alias l="ls -l"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias rmr="rm -r"
alias sl="ls"
alias mak="make"
alias hc="herbstclient"
alias cmd="WINEDEBUG=-all wine cmd"
alias tcli="transmission-cli"

eh()  { emacs $@ & }
seh() { su -c "emacs $@ &"; }

prev() {
  img2sixel $1 -w 350
}

0x0 () {
  curl -F"file=@${1}" https://0x0.st
}

motd