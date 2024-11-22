source ~/.bashrc
source ~/.git-prompt.sh

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

ssh-add -l 2>/dev/null >/dev/null
sshAgentStatus=$?

if [ -L ~/.ssh/ssh_auth_sock ] && [ $sshAgentStatus -ge 1 ]; then
  rm ~/.ssh/ssh_auth_sock
fi

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export PYENV_ROOT="$HOME/.pyenv"

export PATH=$PATH:~/.local/bin
export PATH="$PATH:/home/paul/.pyenv/bin"
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/mnt/c/Program Files/Microsoft VS Code/bin"
export PATH="$PATH:/mnt/c/WINDOWS/system32"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

wsl.exe -d wsl-vpnkit --cd /app service wsl-vpnkit status >/dev/null || wsl.exe -d wsl-vpnkit --cd /app service wsl-vpnkit start

if ! grep -q search /mnt/wsl/resolv.conf;
then
  echo 'search sidetrade.com' | sudo tee -a /mnt/wsl/resolv.conf > /dev/null
fi

if [ -z "${TMUX+x}" ];
then
  tmux
  clear
fi
