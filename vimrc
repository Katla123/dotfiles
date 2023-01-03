" Disable compatability with vi which ca cause unexpected issues.
set nocompatible

filetype on
filetype plugin on
filetype indent on
syntax on

" Set Colorscheme
colorscheme molokai

set nu
set rnu
set mouse=a
set cursorline

set shiftwidth=4
set tabstop=4
set softtabstop=4

set expandtab
set nobackup
set scrolloff=10
set nowrap

set incsearch
set ignorecase
set smartcase

set showcmd
set showmode
set showmatch
set hlsearch
set history=1000

set wildmenu
set wildmode=list:longest

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" PLUGINS ----------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'ervandew/supertab'
    Plug 'nathanaelkane/vim-indent-guides'
call plug#end()
"

" }}}
" MAPPINGS ---------------------------------------------------------- {{{
let mapleader = ","
nnoremap <leader>, ``

" press the spacebar to type the : character in command mode
nnoremap <space> :

" Yank from the cursor to the end of line
nnoremap Y y

" Map F5 key to run a Python script inside Vim
"we map F5 to a chain of commands here
nnoremap <F5> :w <CR>:!clear <CR>:!python3 % <CR>
"
" Navigate splits in vim
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><

" Some of my own commands come here
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>ö :set rnu!<CR>
nnoremap <leader>ä :IndentGuidesToggle<CR>
" }}}
" VIMSCRIPT --------------------------------------------------------- {{{
"
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

if has('gui_running')
    set background=dark

    colorscheme molokai

    set guifont=Monospace\ Regular\ 12

    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=m
    set guioptions-=b


    "Map F4  key to toggle menu, toolbar and scrollbal
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
                \set guioptions-=mTr<Bar>
                \else<Bar>
                \set guioptions+=mTr<Bar>
                \endif<CR>
    
endif


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}
" STATUS LINE ------------------------------------------------------- {{{
"
set statusline=

set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=

set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

set laststatus=2
"
" }}}
