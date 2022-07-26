let mapleader="\<space>"

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
Plugin 'Tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wlangstroth/vim-racket'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'mattn/emmet-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'tikhomirov/vim-glsl'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'hrj/vim-DrawIt'
Plugin 'jstemmer/gotags'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw'
      \    },
      \ }
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'leafgarland/typescript-vim'
Plugin 'honza/vim-snippets'
Plugin 'aquach/vim-mediawiki-editor'
Plugin 'chikamichi/mediawiki.vim'
Plugin 'martinda/Jenkinsfile-vim-syntax' 
Plugin 'tpope/vim-abolish' 
Plugin 'chrisbra/Colorizer'
Plugin 'metakirby5/codi.vim'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'SirVer/ultisnips'

call vundle#end()            " required
filetype plugin indent on     " required!

set encoding=utf-8
syntax on
set incsearch
set number
set cursorline
set ts=2 sw=2 expandtab
set tw=80
highlight LineNr ctermfg=blue ctermbg=Black
nnoremap <leader>rp :.,$s/<c-r>"/<c-r>./gc<enter>
nnoremap <leader>hn :NERDTreeFocus<enter>
nnoremap <leader>rs :w<enter>:source $MYVIMRC<enter>
nnoremap <leader>re :e $MYVIMRC<enter>

nnoremap ' `
nnoremap Y y$
nnoremap ; ?
noremap H ^
noremap L $
nnoremap gh H
nnoremap gl L

imap (( ()<left>
nnoremap gp dET(P

map <a-w> [w
map <a-b> [b
map <A-l> gt
map <A-h> gT
map <A-o> <C-o>
map <A-e> <C-i>

"If you have a vimrc in the current directory then it'll use it?
set exrc

"Function keys
noremap <F1> :NERDTreeToggle<CR>
noremap <F2> :NERDTreeFind<CR>
map s <Plug>(easymotion-prefix)
noremap <leader>y "*y
noremap <leader>p "*p
nnoremap S /
noremap Y y$
"
if has('gui_running')
  "colorscheme solarized
  colorscheme dracula
  set background=dark
  set guifont=Inconsolata:h14:cANSI
  set guioptions-=T
  set guioptions-=m 
endif
set backspace=indent,eol,start

"Text editing stuff
au BufNewFile,BufRead *.txt set spell spelllang=en_us

let g:rainbow_active = 1 

set foldmethod=manual

runtime macros/matchit.vim

set relativenumber
set ignorecase

