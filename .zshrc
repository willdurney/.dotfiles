eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR="vim"
export DIRENV_LOG_FORMAT=

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"
ZSH_DISABLE_COMPFIX="true"
KEYTIMEOUT=8

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

plugins=(direnv autojump vi-mode fzf zsh-interactive-cd alias-finder pyenv aws)

# Show existing aliases if long-form command used
ZSH_ALIAS_FINDER_AUTOMATIC=true

# Custom vi-mode config
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd 'j' down-history
bindkey -M vicmd 'k' up-history

DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

export CHEAT_CONFIG_PATH="~/.dotfiles/cheat/conf.yml"

# Quick access vim-dadbod-ui
alias db="vim +DBUI"

# Sanity preservers
alias :q="exit"
alias q="exit"

export VIM_ENTRY_POINT="."
v () { vim ${VIM_ENTRY_POINT} }

alias sail="vendor/bin/sail"

# Shortlinks
alias wlldrnet="python3 ~/.dotfiles/scripts/wlldrnet.py"

alias update="(cd ~/.dotfiles && ./build.sh)"
