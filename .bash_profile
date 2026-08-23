source ~/.bashrc

[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias ChromeNoCors="open -a Google\ Chrome --args --remote-debugging-port=9222 --disable-web-security --user-data-dir='~/Library/Application Support/Google/Chrome/Default'"
alias ChromeRemoteDebugging="open -a Google\ Chrome --args --remote-debugging-port=9222 --user-data-dir='/Users/ohefnawi/RemoteDebugChrome'"
alias ChromeNoCorsNoUser="open -a Google\ Chrome --args --remote-debugging-port=9222 --disable-web-security --user-data-dir='~/Library/Application Support/Google/Chrome'"
alias ChromeNoCorsOrExtensions="open -a Google\ Chrome --args --disable-web-security --disable-extensions --user-data-dir='~/Library/Application Support/Google/Chrome/Default'"
alias ChromeNoExtensions="open -a Google\ Chrome --args --disable-extensions"
alias ChromeNoCorsCheckout="open /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --no-proxy-server --disable-features=CrossSiteDocumentBlockingAlways,CrossSiteDocumentBlockingIfIsolating --disable-web-security --user-data-dir=/tmp/ChromeUserData/"

function c {
  command=$(compgen -c ohefn:: | fzf --height 50% --reverse --bind "tab:replace-query,enter:accept-or-print-query" --preview
  ↪"grep -h -B 1 -w 'function.*{}' ~/scripts/*")

  history -s $command
  eval "$command"
}

myFunctionsReadlineWidget() {
  local selection
  # Pick a function
  selection=$(compgen -c ohefn:: | \
    fzf --height 50% --reverse --bind "tab:replace-query,enter:accept-or-print-query")

    # Return if nothing selected
    [[ -z "$selection" ]] && return

    # Escape in single quotes
    selection="$selection"

    # Insert into current line at cursor safely
    READLINE_LINE="${READLINE_LINE:0:READLINE_POINT}$selection${READLINE_LINE:READLINE_POINT}"
    READLINE_POINT=$((READLINE_POINT + ${#selection}))
}

bind -x '"\C-g": myFunctionsReadlineWidget'

source ~/.bash_general.sh
