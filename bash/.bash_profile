if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
  source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

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

eval "$(rbenv init -)"
eval "$(opam config env)"

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export EDITOR=nvim

export ANDROID_HOME=$HOME/Library/Android/sdk
export GOPATH=$HOME/go
export PATH=$HOME/.rbenv/bin:$GOPATH:$GOPATH/bin:$HOME/Library/Haskell/bin:$(yarn global bin):$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$HOME/Library/Flutter/bin:$HOME/.linkerd2/bin:$PATH
export PS1="\[$Blue\]\w\[$End\]\[$Magenta\]\$(__git_ps1)\[$End\] \[$Blue\]\u\[$End\]\[$Magenta\]\$\[$End\] "
eval "$(hub alias -s)"

export PATH="$HOME/.cargo/bin:$PATH"
