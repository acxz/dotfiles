"Mostly from Amir Salihefendic
"And xero
"Some from Arch Linux Wiki
"Author of file: acxz

" Tip: Leader is '\'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
:filetype plugin on
:filetype indent on

" Line numbers
set nu
set rnu

" Function for toggling relative/absolute line numbers
function! NumberToggle()
    if(&nu == 1 && &rnu == 1)
        set nornu
        set nu
    else
        set rnu
    endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>

" Number of cols (Line Wrap)
set textwidth=80

" Mouse support
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
colorscheme desert
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show current position
set ruler

" Highlight current line, number, and row
set cursorline
set cursorcolumn
hi CursorLine cterm=None ctermbg=16
hi CursorLineNR cterm=None ctermbg=yellow ctermfg=16
hi CursorColumn cterm=None ctermbg=16
set colorcolumn=82
hi ColorColumn ctermbg=yellow

" Change highlight from brown to blue
hi Constant ctermfg=blue

" Change status line
hi ModeMsg ctermfg=NONE

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set incsearch

" Highlight matches
set hlsearch

" Use different highlight syntax
hi Search ctermfg=black ctermbg=yellow
hi IncSearch ctermfg=black ctermbg=yellow
hi Visual cterm=NONE ctermbg=8

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Show matching breackets when text indicator is over them
set showmatch

" Visual autocomplete for command menu
set wildmenu

" Redraw only when need to
set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Files, backups, and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Text, tab, and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" 1 tab == 2 spaces
"set shiftwidth=2
"set tabstop=2

" Highlight trailing spaces
:hi ExtraWhitespace ctermbg=cyan
:match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Restore cursor position
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Delete trailing spaces after save and return position
"autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" LaTeX indenting"
let g:tex_flavor='latex'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Moving around, tabs, and windows, and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap jj <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Folding
set foldenable

" Open most folds by default
set foldlevelstart=10

" Fold based on indent level
set foldmethod=indent

" Space bar open/closes folds
nnoremap <space> za

" Set folding background color
hi Folded ctermbg=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'rhysd/vim-clang-format'
Plug 'tell-k/vim-autopep8'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'dense-analysis/ale'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
set noruler
set noshowcmd
set laststatus=1

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
    \ 'subseparator': { 'left': '|', 'right': '|' }
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open on vim startup when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open on vim directory startup
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" open on keybind
map <C-n> :NERDTreeToggle<CR>

" close if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> autopep8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:autopep8_disable_show_diff=1
