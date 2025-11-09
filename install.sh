#!/bin/bash

for file in .config/nvim .bash_general.sh .bash_profile scripts .tmux.conf .ideavimrc; do
  rsync -a --relative "$file" ~/
done

install_pkg() {
  if command -v brew &>/dev/null; then
    brew install "$@"
  elif command -v apt &>/dev/null; then
    sudo apt update && sudo apt install -y "$@"
  elif command -v pacman &>/dev/null; then
    sudo pacman -Sy --noconfirm "$@"
  elif command -v dnf &>/dev/null; then
    sudo dnf install -y "$@"
  else
    echo "Unsupported package manager. Please install $* manually."
  fi
}

install_pkg fzf bat tmux neovim jq 
