#!/usr/bin/env bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rm -rf ~/.vim/autoload/pathogen.vim
rm -rf ~/.vim/bundle
rm -rf ~/.vim/colors
curl -fLo ~/.vimrc https://raw.githubusercontent.com/futurityverb/dotfiles/master/.vimrc-slim
vim +PlugInstall +PlugUpdate +qall!
