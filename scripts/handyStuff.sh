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
