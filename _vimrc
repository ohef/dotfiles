let mapleader="\<space>"

set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin()

" let Vundle manage Vundle
" required! 
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'hrj/vim-DrawIt'
Plug 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw'
      \    },
      \ }
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-abolish' 
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'LunarWatcher/auto-pairs', {'branch': 'develop'}
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chrisbra/Colorizer'
Plug 'drn/zoomwin-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ohef/vim-jsonpath'

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

function! RgWordUnderCursor()
  let wordUnderCursor = expand("<cword>")
  :Rg 
  call feedkeys(wordUnderCursor)
endfunction

nnoremap <leader>rp :.,$s/<c-r>"/<c-r>./gc<enter>
nnoremap <leader>hn :NERDTreeFocus<enter>
nnoremap <leader>rs :w<enter>:source $MYVIMRC<enter>
nnoremap <leader>re :e! $MYVIMRC<enter>
nnoremap <leader>ff :Files<enter>
nnoremap <leader>fr :call RgWordUnderCursor()<enter>
nnoremap <leader>fg :GFiles<enter>
nnoremap <leader>fc :GFiles?<enter>
nnoremap <leader>fb :Buffers<enter>
nnoremap <leader>fs :Snippets<enter>
nnoremap <leader>fd :Commits<enter>
nnoremap <leader>vv :Git<enter>
nnoremap <leader>a :Maps<enter>
vnoremap <leader>a :<C-U>Maps<enter>
nnoremap <leader>ht :GFiles<enter>
nnoremap <a-j> <c-d>
nnoremap <a-k> <c-u>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

noremap <leader>y "*y
noremap <leader>p "*p

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>rv  <Plug>(coc-codeaction-selected)
nmap <leader>rv  <Plug>(coc-codeaction-selected)

nnoremap ' `
nnoremap Y y$
nnoremap ; ?
noremap H ^
noremap L $
nnoremap gh H
nnoremap gl L

nnoremap gp dET(P

execute "set <A-o>=\eo"
execute "set <A-e>=\ee"
execute "set <A-t>=\et"
execute "set <A-h>=\eh"

map <a-w> [w
map <a-b> [b
map <A-l> gt
map <A-h> gT
map <A-o> <C-o>
map <A-e> <C-i>
imap <A-t> (
imap <A-h> {

noremap <F1> :NERDTreeToggle<CR>
noremap <F2> :NERDTreeFind<CR>
map s <Plug>(easymotion-prefix)
"map syw <Plug>(easymotion-bd-w)yw''
"map syW <Plug>(easymotion-bd-W)yW''

nmap S <Plug>(easymotion-overwin-f)
nmap F /
noremap Y y$
nmap gs %
xmap gs %

"abbreviations 
ab \. ->

"If you have a vimrc in the current directory then it'll use it?
set exrc

colorscheme dracula

highlight Pmenu ctermfg=white ctermbg=black guibg=#282a36

if has('gui_running')
  set guifont=Inconsolata:h14:cANSI
  set guioptions-=T
  set guioptions-=m
endif

set backspace=indent,eol,start
set ignorecase

"Text editing stuff
au BufNewFile,BufRead *.txt set spell spelllang=en_us

runtime macros/matchit.vim

"Coc backends
"coc-rust-analyzer
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:airline_theme='dracula'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
let g:EasyMotion_keys='aoeuidhtnsn'
