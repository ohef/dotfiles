# copy a file to the clipboard using fzf and bat for preview
function ohefn::copyFile {
  cat $(ls | fzf --preview="bat {}") | pbcopy
}

function ohefn::copyLine {
  echo "$*" 
}

function ohefn::convertMovToWebM {
  fileName="$1"
  basename="${fileName%.*}"
  ffmpeg -i "$fileName" -c:v libvpx-vp9 -crf 32 -b:v 0 -c:a libopus "${basename}.webm"
}

function ohefn::convertLatestCaptureToWebM {
  fileName=$(ls -t ~/Documents | head -n 1)
  ohefn::convertMovToWebM "$fileName"
}

function ohefn::convertMarkdownToSlackClipboard {
  pandoc $1 -t html --ascii | textutil -stdin -format html -convert rtf -stdout | pbcopy
}

function ohefn::convertMovToGif {
  ffmpeg -i "$1" -vf "fps=15,scale=640:-1:flags=lanczos" "$2"
}

function ohefn::convertMarkdownToSlackClipboard {
  pandoc "$1" -t html --ascii | textutil -stdin -format html -convert rtf -stdout | pbcopy
}

function ohefn::npmRun {
  my_command="npm run $(jq '.scripts | keys[]' package.json | fzf)"
  eval "$my_command"
  history -s "$my_command"
}

function ohefn::addRouteToLocalNetwork {
  sudo route -n add -net 192.168.1.0/24 -interface en0
}

function ohefn::askOpenCode {
  opencode run "$*"
}

function op {
  opencode "$*"
}

function ask {
  ohefn::askOpenCode "$*"
}

function ohefn::editOpenCode {
  vim ~/.config/opencode/opencode.json
}
