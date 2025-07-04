let mapleader="\<space>"

set nocompatible               " be iMproved
filetype off                   " required!

" Use <c-space> to trigger completion.
if has('nvim')
  lua require("newInit")
else
  call plug#begin()

  " let Vundle manage Vundle
  " required! 
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'bling/vim-airline'
  Plug 'altercation/vim-colors-solarized'
  " Plug 'dhruvasagar/vim-table-mode'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  " Plug 'hrj/vim-DrawIt'
  Plug 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw'
        \    },
        \ }
  Plug 'dracula/vim', { 'name': 'dracula' }
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-abolish' 
  Plug 'metakirby5/codi.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'LunarWatcher/auto-pairs', {'branch': 'develop'}
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'chrisbra/Colorizer'
  Plug 'drn/zoomwin-vim'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'ohef/vim-jsonpath'
  Plug 'preservim/vim-markdown'
  Plug 'bkad/CamelCaseMotion'
  Plug 'github/copilot.vim'
  Plug 'jpalardy/vim-slime'

  call plug#end()
endif

filetype plugin indent on     " required!

set encoding=utf-8
syntax on
set incsearch
set number
set cursorline
set ts=2 sw=2 expandtab
set tw=120
highlight LineNr ctermfg=blue ctermbg=Black
set termguicolors

set noswapfile

function! RgWordUnderCursor()
  let wordUnderCursor = expand("<cword>")
  :Rg 
  call feedkeys(wordUnderCursor)
endfunction

nnoremap <leader>a :Maps<enter>
nnoremap <A-a> :

nnoremap <leader>fb :Buffers<enter>
nnoremap <leader>fc :GFiles?<enter>
nnoremap <leader>fd :Commits<enter>
nnoremap <leader>ff :Files<enter>
nnoremap <leader>fg :GFiles<enter>
nnoremap <leader>fr :call RgWordUnderCursor()<enter>
nnoremap <leader>fs :Snippets<enter>
nnoremap <leader>fl :Lines<enter>

map <leader>hh :Commands<enter>
nnoremap <leader>hn :NERDTreeFocus<enter>
nnoremap <leader>ht :GFiles<enter>

nnoremap <leader>ree :e! $MYVIMRC<enter>
nnoremap <leader>ren :e! ~/.config\nvim\lua\newInit.lua<enter>
nnoremap <leader>rp :.,$s/<c-r>"/<c-r>./gc<enter>
nnoremap <leader>rs :w<enter>:source $MYVIMRC<enter>

nnoremap <leader>vv :G<enter>
nnoremap <leader>vb :G blame<enter>
nnoremap <leader>vl :G log<enter>
nnoremap <leader>vp :G push<enter>

vnoremap <leader>a :<C-U>Maps<enter>

nnoremap <leader>od :e ~/Desktop<enter>

nnoremap <leader>w <C-W>

noremap <leader>y "*y
noremap <leader>p "*p

nnoremap <a-j> <c-d>
nnoremap <a-k> <c-u>

" bro remap this it's so cool 
" exec '!gh browse -n -c ' . expand('%') . ':' . line('.') . ' | pbcopy'

nnoremap ' `
nnoremap Y y$
nnoremap ; :w<enter>
noremap H ^
noremap L $
nnoremap gh H
nnoremap gl L

nnoremap gp dET(P

"vim specific stuff
if !has('nvim')
  execute "set <A-o>=\eo"
  execute "set <A-e>=\ee"
  execute "set <A-t>=\et"
  execute "set <A-h>=\eh"
  execute "set <A-r>=\er"
  execute "set <A-n>=\en"
  execute "set <A-u>=\eu"
  execute "set <A-;>=\e;"
  execute "set <A-p>=\e:cnext"
  execute "set <A-.>=\e:cprev"
  set noesckeys
endif

map <a-w> [w
map <a-b> [b
map <A-l> gt
map <A-h> gT
map <A-o> <C-o>
map <A-i> <C-i>
map <A-;> :q!<enter>
imap <A-t> (
imap <A-n> )
imap <A-c> {
imap <A-r> }
imap <A-h> :
imap <A-s> -
map <A-u> <C-u>zz
map <A-e> <C-d>zz
map <A-p> :cnext<enter>
map <A-.> :cprev<enter>

noremap <F1> :NERDTreeToggle<CR>
noremap <F2> :NERDTreeFind<CR>
map s <Plug>(easymotion-prefix)
nmap S <Plug>(easymotion-overwin-f)

nmap <a-f> /
noremap Y y$
nmap gs %
xmap gs %

"abbreviations 
ab \. ->
ab \, => 

"If you have a vimrc in the current directory then it'll use it?
set exrc

colorscheme dracula

highlight Pmenu ctermfg=white ctermbg=black guibg=#282a36

if has('gui_running')
  set guifont=Inconsolata:h14
  set guioptions-=T
  set guioptions-=m
endif

set backspace=indent,eol,start
set ignorecase

"Text editing stuff
au BufNewFile,BufRead *.txt set spell spelllang=en_us

runtime macros/matchit.vim

let g:airline_theme='dracula'

if has('nvim')
else
  function! AirlineInit()
    call airline#parts#define_function('jsonpath', 'jsonpath#out')
    call airline#parts#define_condition('jsonpath', '&filetype == "json"')
    call airline#parts#define_accent('jsonpath', 'bold')

    let spc = g:airline_symbols.space
    if exists("+autochdir") && &autochdir == 1
      let g:airline_section_c = airline#section#create(['%<', 'path', spc, '%<', 'jsonpath', spc, 'readonly', 'coc_status', 'lsp_progress'])
    else
      let g:airline_section_c = airline#section#create(['%<', 'file', spc, '%<', 'jsonpath', spc, 'readonly', 'coc_status', 'lsp_progress'])
    endif
  endfunction

  autocmd User AirlineAfterInit call AirlineInit()
endif

let g:UltiSnipsExpandTrigger="<Nop>"

let g:EasyMotion_keys='aoeuidhtnsn'
let g:vim_markdown_no_default_key_mappings = 1

if $TMUX != ""
  let g:slime_target = "tmux"
  let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
endif

"let g:chat_gpt_model='gpt-3.5-turbo'
