source ~/.bashrc

alias ChromeNoCors="open -a Google\ Chrome --args --remote-debugging-port=9222 --disable-web-security --user-data-dir='~/Library/Application Support/Google/Chrome/Default'"
alias ChromeNoCorsNoUser="open -a Google\ Chrome --args --remote-debugging-port=9222 --disable-web-security --user-data-dir='~/Library/Application Support/Google/Chrome'"
alias ChromeNoCorsOrExtensions="open -a Google\ Chrome --args --disable-web-security --disable-extensions --user-data-dir='~/Library/Application Support/Google/Chrome/Default'"
alias ChromeNoExtensions="open -a Google\ Chrome --args --disable-extensions"
alias ChromeNoCorsCheckout="open /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --no-proxy-server --disable-features=CrossSiteDocumentBlockingAlways,CrossSiteDocumentBlockingIfIsolating --disable-web-security --user-data-dir=/tmp/ChromeUserData/"

source ~/.bash_general.sh
