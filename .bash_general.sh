#alias ranger=". ranger"
#alias fastCheckout='__git_dwim_remote_heads | fzf | xargs git checkout'
alias vim='nvim'

function fastCheckout() {
  git stash
  __git_dwim_remote_heads | fzf | xargs git checkout
  git stash pop 
}

function fastSwitch() {
  __git_heads | fzf | xargs git checkout
}

export BAT_THEME=Dracula
export TERM=xterm-256color

#https://gist.github.com/mkottman/1936195
RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"

# tput cnorm
# for i in {0..255}; do     printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"; done
#
 
#PS_LINE=`printf -- '- %.0s' {1..200}`
function parse_git_branch {
  PS_BRANCH=''
  #PS_FILL=${PS_LINE:0:$COLUMNS}
  if [ -d .svn ]; then
    PS_BRANCH="(svn r$(svn info|awk '/Revision/{print $2}'))"
    return
  elif [ -f _FOSSIL_ -o -f .fslckout ]; then
    PS_BRANCH="(fossil $(fossil status|awk '/tags/{print $2}')) "
    return
  fi
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  PS_BRANCH="(git ${ref#refs/heads/}) "
}
PROMPT_COMMAND=parse_git_branch
PS_INFO="$BLUE\w"
PS_GIT="$YELLOW\$PS_BRANCH"
export PS1="${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_GIT}\[\e[32m\][\$(date +%H:%M:%S)]\[\e[0m\]\n${RESET}☥ "
export EDITOR="nvim"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
! [ -d ~/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
[ -n "$TMUX" ] && tmux source-file "$HOME/.tmux.conf"
#tput cnorm
