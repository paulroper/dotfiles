source ~/.bashrc
source ~/.git-prompt.sh

# Doens't seem to be needed anymore... Not sure why!
# source ~/repositories/mintty-colors-solarized/mintty-solarized-light.sh

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

export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export EDITOR=nvim

alias grep='grep --color=always'

export PS1="\[$Blue\]\w\[$End\]\[$Cyan\]\$(__git_ps1)\[$End\] \[$Blue\]\u\[$End\]\[$Magenta\]\$\[$End\] "

eval `dircolors /home/paul/repositories/dircolors-solarized/dircolors.ansi-light`

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
	  eval `ssh-agent`
	    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export PATH=$PATH:~/.local/bin

export PYENV_ROOT="$HOME/.pyenv"
export PATH="/home/paul/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add
