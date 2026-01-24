for file in .config/nvim .bash_general.sh .bash_profile ./scripts/handyStuff.sh .tmux.conf .ideavimrc; do
  rsync -av --dry-run ~/"$file" "$file"
done
