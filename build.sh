#!/bin/bash

echo Installing willdurney/.dotfiles

(cd ~/.dotfiles && git submodule update --init --recursive)

# brew install autojump cheat

# Set up dotfile symlinks
if [ "$(readlink ~/.gitconfig)" != "$HOME/.dotfiles/.gitconfig" ]; then
  ln -si ~/.dotfiles/.gitconfig ~/.gitconfig
fi
if [ "$(readlink ~/.gitignore_global)" != "$HOME/.dotfiles/.gitignore_global" ]; then
  ln -si ~/.dotfiles/.gitignore_global ~/.gitignore_global
fi
if [ "$(readlink ~/.phpcs.xml)" != "$HOME/.dotfiles/.phpcs.xml" ]; then
  ln -si ~/.dotfiles/.phpcs.xml ~/.phpcs.xml
fi
if [ "$(readlink ~/.scss-lint.yml)" != "$HOME/.dotfiles/.scss-lint.yml" ]; then
  ln -si ~/.dotfiles/.scss-lint.yml ~/.scss-lint.yml
fi
if [ "$(readlink ~/.vimrc)" != "$HOME/.dotfiles/.vimrc" ]; then
  ln -si ~/.dotfiles/.vimrc ~/.vimrc
fi

# Source bash aliases
if [ -f ~/.bash_profile ]; then
  grep -qxF 'source ~/.dotfiles/.bashrc' ~/.bash_profile || echo 'source ~/.dotfiles/.bashrc' >> ~/.bash_profile
fi
if [ -f ~/.bashrc ]; then
  grep -qxF 'source ~/.dotfiles/.bashrc' ~/.bashrc || echo 'source ~/.dotfiles/.bashrc' >> ~/.bashrc
fi
if [ -f ~/.zshrc ]; then
  grep -qxF 'source ~/.dotfiles/.bashrc' ~/.zshrc || echo 'source ~/.dotfiles/.bashrc' >> ~/.zshrc
fi

# Set up vim
grep -qxF "call plug#begin('~/.vim/plugged')" ~/.vimrc && (
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +PlugUpdate +qall!
)

echo Successfully installed!
