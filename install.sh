#!/bin/bash

for file in .config/nvim/ .bash_general.sh .bash_profile ./scripts/handyStuff.sh .tmux.conf _vimrc .ideavimrc; do
  rsync -a --relative "$file" ~/
done

rm ~/.config/nvim/init.vim
ln -s ~/_vimrc ~/.config/nvim/init.vim 

install_pkg() {
  if command -v brew &>/dev/null; then
    brew install "$@"
  elif command -v apt &>/dev/null; then
    #sudo apt update && sudo apt install -y "$@"
    brew install "$@"
  elif command -v pacman &>/dev/null; then
    sudo pacman -Sy --noconfirm "$@"
  elif command -v dnf &>/dev/null; then
    sudo dnf install -y "$@"
  else
    echo "Unsupported package manager. Please install $* manually."
  fi
}

# https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/InconsolataLGC.zip

while getopts "i" opt; do
  case "$opt" in
    i) 
	    install_pkg fzf bat tmux neovim jq gh npm nodejs ripgrep bash-language-server
	    ;;
    *)
      echo
      ;;
  esac
done
