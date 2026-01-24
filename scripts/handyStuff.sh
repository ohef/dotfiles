# copy a file to the clipboard using fzf and bat for preview
function ohefn::copyFile {
  cat $(ls | fzf --preview="bat {}") | pbcopy
}

function ohefn::copyLine {
  echo "$*" 
}

function ohefn::convertMovToWebM {
  ffmpeg -i $1 -c:v libvpx-vp9 -crf 32 -b:v 0 -c:a libopus $2
}
