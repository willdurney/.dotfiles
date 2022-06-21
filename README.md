# Will Durney's dotfiles

This repo contains some of my personal customizations for developing in OSX.

## What's included?

- [Oh My Zsh](https://ohmyz.sh/) and Zsh config
- Homebrew packages
  - [node](https://nodejs.org/en/)
  - [direnv](https://direnv.net/)
  - vim
  - [autojump](https://github.com/wting/autojump)
  - [cheat](https://github.com/cheat/cheat)
  - [ag](https://github.com/ggreer/the_silver_searcher)
  - [jq](https://github.com/stedolan/jq)
  - [thefuck](https://github.com/nvbn/thefuck)
  - [ctags](http://ctags.sourceforge.net/)
- Cheatsheets (community only for now, supports more)
- PHP & SCSS style config
- Vimrc + a "slimmed-down" vimrc for servers or newbies
  - Custom [UltiSnips](https://github.com/SirVer/ultisnips) code snippets
- Git config (don't just blindly use this)
- Other silly stuff

## Installation

To install, clone the repo and run the included build script. The build script is nondestructive;
you'll be prompted to replace existing dotfiles with symlinks.

```
git clone git@github.com:willdurney/.dotfiles.git ~/.dotfiles && ~/.dotfiles/build.sh
```
