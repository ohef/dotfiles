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
Plug 'preservim/vim-markdown'
Plug 'bkad/CamelCaseMotion'

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

nnoremap <leader>hn :NERDTreeFocus<enter>
nnoremap <leader>ht :GFiles<enter>

nnoremap <leader>re :e! $MYVIMRC<enter>
nnoremap <leader>rp :.,$s/<c-r>"/<c-r>./gc<enter>
nnoremap <leader>rs :w<enter>:source $MYVIMRC<enter>

nnoremap <leader>vv :Git<enter>
nnoremap <leader>vb :Git blame<enter>
nnoremap <leader>vl :Git log<enter>

nnoremap <leader>od :e ~/Desktop<enter>

nnoremap <leader>w <C-W>

vnoremap <leader>a :<C-U>Maps<enter>

nnoremap <a-j> <c-d>
nnoremap <a-k> <c-u>

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
nnoremap ; :w<enter>
nnoremap ; :w<enter>
noremap H ^
noremap L $
nnoremap gh H
nnoremap gl L

nnoremap gp dET(P

execute "set <A-o>=\eo"
execute "set <A-e>=\ee"
execute "set <A-t>=\et"
execute "set <A-h>=\eh"
execute "set <A-r>=\er"
execute "set <A-n>=\en"
execute "set <A-u>=\eu"
execute "set <A-;>=\e;"

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

noremap <F1> :NERDTreeToggle<CR>
noremap <F2> :NERDTreeFind<CR>
map s <Plug>(easymotion-prefix)
"map syw <Plug>(easymotion-bd-w)yw''
"map syW <Plug>(easymotion-bd-W)yW''

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

"START OF COC RIPPING ------------------------------------------------------------ 

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

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"END OF COC RIPPING ------------------------------------------------------------ 

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

"let g:UltiSnipsExpandTrigger="<Nop>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
let g:EasyMotion_keys='aoeuidhtnsn'

let g:vim_markdown_no_default_key_mappings = 1
