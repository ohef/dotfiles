let mapleader="\<space>"

set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin()

" let Vundle manage Vundle
" required! 
Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'wlangstroth/vim-racket'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mattn/emmet-vim'
Plug 'eagletmt/neco-ghc'
Plug 'tikhomirov/vim-glsl'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'hrj/vim-DrawIt'
Plug 'jstemmer/gotags'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw'
      \    },
      \ }
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'leafgarland/typescript-vim'
Plug 'honza/vim-snippets'
Plug 'aquach/vim-mediawiki-editor'
Plug 'chikamichi/mediawiki.vim'
Plug 'martinda/Jenkinsfile-vim-syntax' 
Plug 'tpope/vim-abolish' 
Plug 'chrisbra/Colorizer'
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()            " required
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
noremap S /
noremap Y y$
"
if has('gui_running')
  "colorscheme solarized
  colorscheme dracula
  set background=light
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

