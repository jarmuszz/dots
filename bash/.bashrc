# My root and main account share the same home
[ "$UID" -eq "0" ] && export PS1="# " || export PS1="% "

# Source pywal
. ~/.cache/wal/colors.sh

shopt -s autocd

ng() {
	# Noglob
	set -f
	$@
	set +f
}


# One-line functions
fun() { eval "function $1 {" ${2} '; }'; }


fun 0x0		'curl -F"file=@${1}" https://0x0.st'
fun smap	'map -s " " $1'
fun lmap	"map \"lam '\$*'\""
fun slmap "map -s ' ' \"lam '\$*'\""

# Load libraries
fun lib '. ~/.local/lib/shell/$1 2>/dev/null || echo Library \"$1\" Not found.'

[ "$(uname -o)" = "FreeBSD" ] && lib freebsd
lib higher
lib aliases

motd
