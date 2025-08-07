#!/bin/bash
set -euo pipefail

echo "Installing willdurney/.dotfiles"
echo "Sit back, mate, and let the magic happen."

# Utility function for symlink creation
create_symlink() {
  local target=$1
  local link=$2
  if [ "$(readlink "$link")" != "$target" ]; then
    if [[ -e "$link" || $(bash -c "read -p \"Create $link? [y/N]: \" c; echo \$c") =~ ^[Yy]$ ]]; then
      echo "Creating symlink: $link -> $target"
      ln -si "$target" "$link"
    fi
  fi
}

# Finder settings
configure_finder() {
  echo "Configuring Finder settings..."
  defaults write com.apple.finder AppleShowAllFiles YES
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.finder ShowStatusBar -bool true
  killall Finder || true
}

# Install Homebrew
install_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew already installed. Updating..."
    brew update
  fi
}

# Install packages with Homebrew
install_brew_packages() {
  echo "Installing Homebrew packages..."
  local packages=(
    autojump awscli cheat ctags composer direnv jq just mysql-client node pyenv
    pyenv-virtualenv python3 the_silver_searcher thefuck vim
  )
  brew install "${packages[@]}"
  brew install --cask docker
  brew install --cask iterm2
  brew install --cask karabiner-elements
  brew cleanup
}

# Set up Python environment
setup_python_env() {
  local python_version=3.13.0
  echo "Setting up Python environment for scripts..."
  (
    cd ~/.dotfiles/scripts
    pyenv install --skip-existing "$python_version"
    pyenv virtualenv "$python_version" willdurney || true
    source ~/.pyenv/versions/willdurney/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
  )
}

# Oh-My-Zsh installation
install_oh_my_zsh() {
  if [[ ! -d ~/.oh-my-zsh ]]; then
    if [[ $(bash -c "read -p \"Install Oh-My-Zsh? [y/N]: \" c; echo \$c") =~ ^[Yy]$ ]]; then
      echo "Installing Oh-My-Zsh..."
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      echo "Open a new shell session and re-run this script."
      exit
    fi
  else
    echo "Oh-My-Zsh already installed. Updating..."
    zsh -c 'source ~/.zshrc && "$ZSH/tools/upgrade.sh"'
  fi
}

# Set up symlinks
setup_symlinks() {
  echo "Setting up symlinks..."
  create_symlink "$HOME/.dotfiles/.zshrc" "$HOME/.zshrc"
  create_symlink "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"
  create_symlink "$HOME/.dotfiles/.gitignore_global" "$HOME/.gitignore_global"
  create_symlink "$HOME/.dotfiles/.vimrc" "$HOME/.vimrc"
  mkdir -p ~/.vim
  create_symlink "$HOME/.dotfiles/coc-settings.json" "$HOME/.vim/coc-settings.json"
  create_symlink "$HOME/.dotfiles/snippets" "$HOME/.vim/UltiSnips"
  mkdir -p ~/.config/direnv
  create_symlink "$HOME/.dotfiles/direnv.toml" "$HOME/.config/direnv/direnv.toml"
}

# Set up Vim with Plug
setup_vim() {
  echo "Configuring Vim..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir -p ~/.vim/undodir
  vim +PlugInstall +PlugUpdate +qall!
}

# Main script execution
main() {
  configure_finder
  (cd ~/.dotfiles && git submodule update --init --recursive)
  install_homebrew
  install_brew_packages
  install_oh_my_zsh
  setup_python_env
  setup_symlinks
  setup_vim
  echo "All done! Successfully installed everything. Now go break stuff with style."
}

main
