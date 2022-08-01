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
Plug 'honza/vim-snippets'
Plug 'tpope/vim-abolish' 
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'LunarWatcher/auto-pairs', {'branch': 'develop'}
Plug 'vim-airline/vim-airline-themes'

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

nnoremap gp dET(P

map <a-w> [w
map <a-b> [b
map <A-l> gt
map <A-h> gT
map <A-o> <C-o>
map <A-e> <C-i>
imap <A-t> (

"Function keys
noremap <F1> :NERDTreeToggle<CR>
noremap <F2> :NERDTreeFind<CR>
map s <Plug>(easymotion-prefix)
noremap <leader>y "*y
noremap <leader>p "*p
nnoremap S /
noremap Y y$
nnoremap gs %

"If you have a vimrc in the current directory then it'll use it?
set exrc

colorscheme dracula
set background=dark
set guifont=Inconsolata:h14:cANSI
highlight Pmenu ctermfg=white ctermbg=black

set backspace=indent,eol,start
set relativenumber
set ignorecase

"Text editing stuff
au BufNewFile,BufRead *.txt set spell spelllang=en_us

"set foldmethod=manual

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>rv  <Plug>(coc-codeaction-selected)
nmap <leader>rv  <Plug>(coc-codeaction-selected)

"xmap <leader>ac <Plug>(coc-codeaction-cursor)
"nmap <leader>ac <Plug>(coc-codeaction-cursor)
