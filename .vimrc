"Mostly from Amir Salihefendic
"Some from Arch Linux Wiki
"Author of file: AkashPatel435

" Tip: Leader is '\'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
:filetype plugin on
:filetype indent on

" Line numbers
set number

" Number of cols (Line Wrap)
set textwidth=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
colorscheme default
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show current position
set ruler

" Highlight current line, number, and row
set cursorline
set cursorcolumn
hi CursorLine cterm=None ctermbg=black
hi CursorLineNR cterm=None ctermbg=yellow ctermfg=black
hi CursorColumn cterm=None ctermbg=black
set colorcolumn=81

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set incsearch

" Highlight matches
set hlsearch

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Show matching breackets when text indicator is over them
set showmatch

" Visual autocomplete for command menu
set wildmenu

" Redraw only when need to
set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Files, backups, and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Text, tab, and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Moving around, tabs, and windows, and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"Move vertically by visual line
nnoremap j gj
nnoremap k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap jj <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"===> Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
