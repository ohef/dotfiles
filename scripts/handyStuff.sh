function removeExtension {
  local name="${1%.*}" # remove extension
  echo "$name"
}

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
  nvim ~/.config/opencode/opencode.json
}

# Compress video using H.264, 16fps, CRF 32, and AAC audio at 44k for efficient sharing
function ohefn::compressVideoToShare {
  local name="${1%.*}" # remove extension

  ffmpeg -i "$1" \
    -r 16 \
    -c:v libvpx-vp9 \
    -crf 34 \
    -b:v 0 \
    -row-mt 1 \
    -c:a libopus -b:a 48k \
    "${name}.webm"
}

function ohefn::openCodeWeb {
  opencode web --hostname 0.0.0.0 --port 60000
}

function ohefn::openCodeWeb {
  opencode web --hostname 0.0.0.0 --port 60000
}

function ohefn::compressImageFile {
  magick "$1" -strip -quality 80 "$(removeExtension $1)-output.jpg"
}

function ohefn::tmuxPopupOpencode {
  page_file=/tmp/tmux-page.txt
  tmux capture-pane -p -S - > "$page_file"
  tmux display-popup -w 95% -h 95% -E '
  printf "Input: "
  read -r input
  opencode --auto --prompt="$(
    {
      cat /tmp/tmux-page.txt
      echo
      echo "$input"
    }
  )"
  '
}

