# My root and main account share the same home
[ "$UID" -eq "0" ] && export PS1="# " || export PS1="% "

# Source pywal
. ~/.cache/wal/colors.sh

shopt -s autocd

# One-line functions
fun() { eval "function $1 {" ${2} '; }'; }

fun 0x0		'curl -F"file=@${1}" https://0x0.st'
fun smap	'map -s " " $1'

# Load libraries
fun lib '. ~/.local/lib/shell/$1 2>/dev/null || echo Library \"$1\" Not found.'

case "$(uname -o)" in
	FreeBSD)
		lib freebsd
		;;
	*)
		[ -f "/etc/debian_version" ] &&
			lib debian
		;;
esac
lib higher
lib aliases
lib marks

# Bash completition
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

motd
