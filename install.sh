#!/bin/bash

syncRepoToHome='rsync -a --relative "$file" ~/'
syncHomeToRepo='rsync -av ~/"$file" "$file"'
chosenSyncMethod=''

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

while getopts "ish" opt; do
  case "$opt" in
    i) 
	    install_pkg fzf bat tmux neovim jq gh npm nodejs ripgrep bash-language-server
	    ;;
    s) 
      echo syncing repo to home 
      chosenSyncMethod=$syncRepoToHome
	    ;;
    h) 
      echo syncing home to repo
      chosenSyncMethod=$syncHomeToRepo
	    ;;
    *)
      echo whatever is here
      ;;
  esac
done

for file in .config/nvim/ .bash_general.sh .bash_profile ./scripts/handyStuff.sh .tmux.conf _vimrc .ideavimrc; do
  eval $chosenSyncMethod
done

rm ~/.config/nvim/init.vim
ln -s ~/_vimrc ~/.config/nvim/init.vim 

# https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/InconsolataLGC.zip
