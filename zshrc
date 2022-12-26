# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
autoload -U compinit; compinit
# End of lines configured by zsh-newuser-install

alias hx="helix"
alias ls="ls --color"
alias hl="dbus-launch Hyprland"

eval "$(starship init zsh)"