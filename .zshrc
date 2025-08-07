eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR="vim"

zstyle ':omz:alpha:lib:git' async-prompt no
zstyle ':omz:plugins:nvm' autoload yes
zstyle ':omz:plugins:nvm' silent-autoload yes

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"
ZSH_DISABLE_COMPFIX="true"
KEYTIMEOUT=8

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(thefuck --alias)"

plugins=(direnv autojump vi-mode fzf zsh-interactive-cd alias-finder pyenv aws dotenv nvm)

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
function wll() {
    # Change to the script directory
    cd $HOME/.dotfiles/scripts

    # Activate the virtual environment
    eval "$(pyenv init -)"
    pyenv activate willdurney

    # Run the Python script with the argument
    python "wlldrnet.py" "$@"

    # Deactivate the virtual environment
    pyenv deactivate
}

alias update="(cd ~/.dotfiles && ./setup.sh)"
export PATH=$PATH:$HOME/.dotfiles/scripts

# export PATH=$PATH:/opt/homebrew/opt/mysql-client/bin
# export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"

export FZF_DEFAULT_COMMAND="ag -l -U --hidden -g \"\" --ignore .git --ignore venv --ignore .mypy_cache --ignore .next --ignore node_modules"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include/postgresql@15"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib/postgresql@15"
export PG_CONFIG="/opt/homebrew/opt/postgresql@15/bin/pg_config"
export DYLD_LIBRARY_PATH="/opt/homebrew/opt/postgresql@15/lib/postgresql@15:$DYLD_LIBRARY_PATH"

export PHPENV_ROOT="/Users/willdurney/.phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
  eval "$(phpenv init -)"
fi
export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"

export CPPFLAGS="-I/opt/homebrew/opt/bzip2/include"
export LDFLAGS="-L/opt/homebrew/opt/bzip2/lib"
export PKG_CONFIG_PATH="/opt/homebrew/opt/bzip2/lib/pkgconfig"
