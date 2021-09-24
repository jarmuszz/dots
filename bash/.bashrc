# My root and main account share the same home
[ "$UID" -eq "0" ] && export PS1="# " || export PS1="% "

. ~/.cache/wal/colors.sh

shopt -s autocd

# Aliases
alias sudo="doas "
alias vim="nvim"

## Ls
alias ls="ls --color=auto"
alias sl="ls"
alias l="ls -l"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias s="ls -sh"

## Editors
alias e="emacs -nw"
alias se="sudo emacs -nw"
alias v="nvim"
alias n="nvim"
alias sv="sudo nvim"
alias vv="nvim -S Session.vim"

## Programming
alias cl="clisp"
alias rsbcl="rlwrap sbcl"

## Tr
alias s2n='tr " " "\n"'
alias n2s='tr "\n" " "'

## Shorthands
alias h="htop -C"
alias rmr="rm -r"
alias mak="make"
alias cmd="WINEDEBUG=-all wine cmd"
alias tcli="transmission-cli"
alias ch="curl -s 'ftp://ftp.osuosl.org/pub/slackware/slackware-current/ChangeLog.txt' | less"
alias so="REPO=~/sbo/repo; . ~/prj/shell/sbo-shell/sbo-shell.sh"
alias ssr="simplescreenrecorder"

ng() {
	# Noglob
	set -f
	$@
	set +f
}

oodsb() {
	# Out-of-date slackbuild
	dl="${DOWNLOAD_x86_64:-${DOWNLOAD}}"
	str="${dl#*com/}"
	nv "$str" | sed 's/\/archive.*//'
}

map() {
	# Mapping function
	if [ "$1" = "-s" ]; then
		application="`sed 's/'$2'/\n/g' /dev/stdin`"
		shift 2
	else
		application="`cat /dev/stdin`"
	fi

	echo "$application" | while read -r args; do $@ $args; done

	unset -v application
}

lam() {
	# Lambda
	[ -z "$1" ] && return 1

	fname="l`mcookie`"
	fun $fname "$1"
	shift
	$fname $@

	unset -f $fname 
	unset -v fname
}

# One-line functions
fun() { eval "function $1 {" "${2}" '; }'; }
fun prev	'img2sixel $1 -w 350'
fun 0x0		'curl -F"file=@${1}" https://0x0.st'
fun rc		'sudo sh /etc/rc.d/rc.$*'
fun smap	'map -s " " $1'
fun lmap	"map \"lam '\$*'\""
fun slmap "map -s ' ' \"lam '\$*'\""

# Nix
[ -e /home/jarmusz/.nix-profile/etc/profile.d/nix.sh ] && 
	. /home/jarmusz/.nix-profile/etc/profile.d/nix.sh
export PATH="${PATH}:/home/jarmusz/.nix-profile/bin"

motd
