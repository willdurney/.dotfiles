#!/bin/bash

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

alias db="vim +DBUI"

alias :q="exit"
alias q="exit"

export CHEAT_CONFIG_PATH="~/.dotfiles/cheat/conf.yml"

alias wlldrnet="python3 ~/.dotfiles/scripts/wlldrnet.py"

