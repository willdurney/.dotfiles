export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"

plugins=(direnv autojump vi-mode fzf zsh-interactive-cd)

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd 'j' down-history
bindkey -M vicmd 'k' up-history

ZSH_DISABLE_COMPFIX="true"
KEYTIMEOUT=8

source $ZSH/oh-my-zsh.sh

alias db="vim +DBUI"

alias :q="exit"
alias q="exit"

export CHEAT_CONFIG_PATH="~/.dotfiles/cheat/conf.yml"

alias wlldrnet="python3 ~/.dotfiles/scripts/wlldrnet.py"
