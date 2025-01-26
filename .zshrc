HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

precmd() {
  precmd() {
    echo
  }
}

autoload -U compinit; compinit
autoload -Uz add-zsh-hook vcs_info

setopt prompt_subst

add-zsh-hook precmd vcs_info

PROMPT='%F{blue}%~ %F{red}${vcs_info_msg_0_}%f 
> '


zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'


alias ls="ls --color"
alias sw="dbus-run-session sway --unsupported-gpu"
