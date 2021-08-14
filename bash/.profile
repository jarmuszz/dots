#
# ~/.profle
#

# Exports
export PATH="${PATH}:/home/jarmusz/.local/bin/:/home/jarmusz/.scripts:/usr/lib/plan9/bin"
export TERMINAl="urxvt"
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
export CALCHISTFILE=''

# Qt5
export QT_QPA_PLATFORMTHEME=qt5ct

# pfetch
export PF_COLOR=0

# dialog
export DIALOGRC="~/.config/dialog"

# wine prefix
export WINEPREFIX="~/.cache/wine"

# ls
export LS_COLORS="no=00:fi=00:di=0;1:ex=0;31:ln=0;4"

. ~/.bashrc

# startx on tty1
[ "`tty`" = "/dev/tty1" ] && startx
