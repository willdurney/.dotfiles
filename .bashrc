#!/bin/bash

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

alias :q="exit"
alias q="exit"

alias wlldrnet="python ~/.dotfiles/scripts/wlldrnet.py"

export CHEAT_CONFIG_PATH="~/.dotfiles/cheat/conf.yml"
