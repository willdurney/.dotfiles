#!/bin/bash

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

alias :q="exit"
alias q="exit"

alias wlldrnet="python ~/.dotfiles/scripts/wlldrnet.py"

export CHEAT_CONFIG_PATH="~/.dotfiles/cheat/conf.yml"
