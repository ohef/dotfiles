# copy a file to the clipboard using fzf and bat for preview
function ohefn::copyFile {
  cat $(ls | fzf --preview="bat {}") | pbcopy
}
