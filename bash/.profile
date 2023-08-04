#
# ~/.profle
#

# Exports
export PATH="/home/jarmusz/.local/bin/:${PATH}:/home/jarmusz/.nix-profile/bin:/usr/pkg/bin/usr/pkg/sbin:/home/jarmusz/.scripts:/sbin:/usr/sbin:/home/jarmusz/.local/share/coursier/bin:/home/jarmusz/.cargo/bin:/home/jarmusz/.ghcup/bin"
export MANPATH="~/.local/share/man:/usr/pkg/man:$MANPATH"
export TERMINAL="tym"
export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL="codium"
export PAGER="less"

# XDG
export XDG_CONFIG_HOME="/home/jarmusz/.config"
export XDG_CACHE_HOME="/home/jarmusz/.cache"
export XDG_DATA_HOME="/home/jarmusz/.local/share"

#export VIMINIT='source '${XDG_CONFIG_HOME}'/vim/vimrc'
export LESSHISTFILE='-'
export CALCHISTFILE='/dev/null'

# Qt5
#export QT_QPA_PLATFORMTHEME=qt5ct

# dialog
export DIALOGRC="~/.config/dialog"

# wine prefix
export WINEPREFIX="/home/jarmusz/.cache/wine"

# ls
export LS_COLORS="no=00:fi=00:di=0;1:ex=0;3:ln=0;4:su=40;01"

# Smooth scrolling in firefox
export MOZ_USE_XINPUT2=1 

. ~/.bashrc

# startx on tty1
[ "$(tty)" = "/dev/tty1" ] && {
	(sleep 3 && /usr/libexec/xdg-desktop-portal-wlr) &
	dbus-run-session sway
}
