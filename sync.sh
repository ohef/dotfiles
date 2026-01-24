#!/bin/bash

for file in .config/nvim/ .bash_general.sh .bash_profile ./scripts/handyStuff.sh .tmux.conf .ideavimrc _vimrc; do
  rsync -av ~/"$file" "$file"
done
