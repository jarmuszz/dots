# My root and main account share the same home
[ "$UID" -eq "0" ] && export PS1="# " || export PS1="% "

. ~/.cache/wal/colors.sh

export LS_COLORS="no=00:fi=00:di=0;1:ex=0;31:ln=0;4"

shopt -s autocd

export WINEPREFIX=~/.cache/wine

alias sudo="doas"
alias vim="nvim"
alias ls="ls --color=auto"

alias e="emacs -nw"
alias se="sudo emacs -nw"
alias v="nvim"
alias n="nvim"
alias sv="sudo nvim"
alias h="htop -C"
alias cl="clisp"
alias rsbcl="rlwrap sbcl"
alias p="slackpkg"
alias sp="sudo slackpkg"
alias l="ls -l"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias s="ls -sh"
alias rmr="rm -r"
alias sl="ls"
alias mak="make"
alias cmd="WINEDEBUG=-all wine cmd"
alias tcli="transmission-cli"
alias ch="curl -s 'ftp://ftp.osuosl.org/pub/slackware/slackware-current/ChangeLog.txt' | less"

eh()  { emacs $@ & }
seh() { su -c "emacs $@ &"; }

prev() {
  img2sixel $1 -w 350
}

0x0() {
  curl -F"file=@${1}" https://0x0.st
}

urxtell() {
  [ -z "$1" ] && return
  printf '\33]50;%s\007' $*
}

rc() {
  /etc/rc.d/rc.$*
}

motd
