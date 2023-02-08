# Reset
End='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Magenta='\e[0;35m'       # Magenta
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

export TERM=xterm-256color
export CLICOLOR=1
export LS_COLORS='di=36:ln=35:so=31;1;44:pi=30;1;44:ex=1;31:bd=0;1;44:cd=37;1;44:su=37;1;41:sg=30;1;43:tw=30;1;42:ow=30;1;43'
export EDITOR=vim

export PS1="\[$Blue\]\w\[$End\]\[$Magenta\]\[$End\] \[$Blue\]\u\[$End\]\[$Magenta\]\$\[$End\] "

alias ls='ls --color=auto'

cd /media/fat
