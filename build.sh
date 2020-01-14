#!/bin/bash

echo Installing willdurney/.dotfiles

(cd ~/.dotfiles && git submodule update --init --recursive)

ln -si ~/.dotfiles/.gitconfig ~/.gitconfig
ln -si ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -si ~/.dotfiles/.phpcs.xml ~/.phpcs.xml
ln -si ~/.dotfiles/.scss-lint.yml ~/.scss-lint.yml
ln -si ~/.dotfiles/.vimrc ~/.vimrc

echo Successfully installed
