#!/bin/bash

echo Installing willdurney/.dotfiles

(cd ~/.dotfiles && git submodule update --init --recursive)

brew install node direnv vim autojump cheat the_silver_searcher jq thefuck ctags
pip3 install -r $HOME/.dotfiles/scripts/requirements.txt

# Install oh-my-zsh
if [[ ! -d ~/.oh-my-zsh && $(bash -c "read -p \"install oh-my-zsh? \" c; echo \$c") =~ ^[Yy]$ ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
elif [[ -d ~/.oh-my-zsh ]]; then
  zsh -c 'source .zshrc && omz update --unattended'
fi

# Set up dotfile symlinks
if [ "$(readlink ~/.zshrc)" != "$HOME/.dotfiles/.zshrc" ]; then
  if [[ -a ~/.zshrc || $(bash -c "read -p \"create $HOME/.zshrc? \" c; echo \$c") =~ ^[Yy]$ ]]; then
    ln -si ~/.dotfiles/.zshrc ~/.zshrc
  fi
fi
if [ "$(readlink ~/.gitconfig)" != "$HOME/.dotfiles/.gitconfig" ]; then
  if [[ -a ~/.gitconfig || $(bash -c "read -p \"create $HOME/.gitconfig? \" c; echo \$c") =~ ^[Yy]$ ]]; then
    ln -si ~/.dotfiles/.gitconfig ~/.gitconfig
  fi
fi
if [ "$(readlink ~/.gitignore_global)" != "$HOME/.dotfiles/.gitignore_global" ]; then
  if [[ -a ~/.gitignore_global || $(bash -c "read -p \"create $HOME/.gitignore_global? \" c; echo \$c") =~ ^[Yy]$ ]]; then
    ln -si ~/.dotfiles/.gitignore_global ~/.gitignore_global
  fi
fi
if [ "$(readlink ~/.phpcs.xml)" != "$HOME/.dotfiles/.phpcs.xml" ]; then
  if [[ -a ~/.phpcs.xml || $(bash -c "read -p \"create $HOME/.phpcs.xml? \" c; echo \$c") =~ ^[Yy]$ ]]; then
    ln -si ~/.dotfiles/.phpcs.xml ~/.phpcs.xml
  fi
fi
if [ "$(readlink ~/.scss-lint.yml)" != "$HOME/.dotfiles/.scss-lint.yml" ]; then
  if [[ -a ~/.scss-lint.yml || $(bash -c "read -p \"create $HOME/.scss-lint.yml? \" c; echo \$c") =~ ^[Yy]$ ]]; then
    ln -si ~/.dotfiles/.scss-lint.yml ~/.scss-lint.yml
  fi
fi
if [ "$(readlink ~/.vimrc)" != "$HOME/.dotfiles/.vimrc" ]; then
  if [[ -a ~/.vimrc || $(bash -c "read -p \"create $HOME/.vimrc? \" c; echo \$c") =~ ^[Yy]$ ]]; then
    ln -si ~/.dotfiles/.vimrc ~/.vimrc
  fi
fi
if [ "$(readlink ~/.vim/coc-settings.json)" != "$HOME/.dotfiles/coc-settings.json" ]; then
  if [[ -a ~/.vim/coc-settings.json || $(bash -c "read -p \"create $HOME/.vim/coc-settings.json? \" c; echo \$c") =~ ^[Yy]$ ]]; then
    ln -si ~/.dotfiles/coc-settings.json ~/.vim/coc-settings.json
  fi
fi
if [ "$(readlink ~/.vim/UltiSnips)" != "$HOME/.dotfiles/snippets" ]; then
  if [[ -d ~/.vim/UltiSnips ]]; then
    if [[ $(bash -c "read -p \"replace $HOME/.vim/UltiSnips? \" c; echo \$c") =~ ^[Yy]$ ]]; then
      rm -rf ~/.vim/UltiSnips
      ln -s ~/.dotfiles/snippets ~/.vim/Ultisnips
    fi
  elif [[ $(bash -c "read -p \"create $HOME/.vim/UltiSnips? \" c; echo \$c") =~ ^[Yy]$ ]]; then
    ln -si ~/.dotfiles/snippets ~/.vim/UltiSnips
  fi
fi

# Set up vim
grep -qxF "call plug#begin('~/.vim/plugged')" ~/.vimrc && (
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir -p ~/.vim/undodir
  vim +PlugInstall +PlugUpdate +qall!
)

echo Successfully installed!
