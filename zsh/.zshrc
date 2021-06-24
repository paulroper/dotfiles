export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export EDITOR=nvim

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %F{magenta}(%b)%f'

export PROMPT='%F{blue}%~%f${vcs_info_msg_0_} %F{blue}%n%f%F{magenta}$%f '

bindkey -e
ssh-add
