#
# ~/.profle
#

# Exports
export PATH="${PATH}:/home/jarmusz/.local/bin/:/home/jarmusz/.scripts:/sbin:/usr/sbin"
export TERMINAl="xterm"
export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL="nvim"
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
export LS_COLORS="no=00:fi=00:di=0;1:ex=0;31:ln=0;4"
export LSCOLORS="Axcxxxxxbx"

. ~/.bashrc

# startx on tty1
[ "$(tty)" = "/dev/tty1" ] && startx
