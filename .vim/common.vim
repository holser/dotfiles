"=========
" BEHAVIOR
"=========
" be iMproved!
set nocompatible
" ========
" Behavior
" ========
" hide the launch screen
set shortmess+=I
" do not force to save buffers when switching to new ones
set hidden
" ignore case when searching
set ignorecase
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
" use incremental search
set incsearch
" automatically read a file that is changed from outside
set autoread

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"
" leave the insert mode fatser on terminal
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"==========================
" TABS, INDENTS AND FOLDING
"==========================
filetype plugin indent on
set tabstop=4
set expandtab
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab
set shiftwidth=4
set shiftround

" fold based on indent
set foldmethod=indent
" start with all open folds
set foldlevelstart=99
" deepest fold is 5 levels
set foldnestmax=5

set autoindent
" Use smart indendation if there is no indent file
set smartindent
" copy the previous indentation on autoindenting
set copyindent

" alter tab settings for C files according to Python/C suggestions
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=8
        set noexpandtab
    el
        set shiftwidth=4
        set expandtab
    en
endf
autocmd BufRead,BufNewFile *.c,*.h call Select_c_style()
autocmd BufRead,BufNewFile Makefile* set noexpandtab

"========
" VISUALS
"========
syntax on
" Show colored border column
set colorcolumn=80
" Show line numbers
set number relativenumber
" Diff shows vertical split by default
set diffopt+=vertical
" set show matching parenthesis
set showmatch
" highlight search terms
set hlsearch

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

if has("gui_running")
    set guioptions-=T " remove toolbar
    set guioptions-=l
    set guioptions-=L " remove left-hand scroll bar even from NERDTree
    set guioptions-=r " Removing right scroll bar
    set guioptions-=R
    set mouse=a
else
    set mouse-=a
endif

" Set interaction with system clipboard and mouse
if has('unnamedplus')
    set clipboard=unnamedplus
else
    if $TMUX == ''
        set clipboard=unnamed
    endif
endif

set mousemodel=popup_setpos
" Always show status line
set laststatus=2

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red


"================
" FILES AND TYPES
"================
" disable auxillary files creation
set nobackup
set noswapfile

" wild char completion menu
set wildmenu
" ignore these files when searching etc
set wildignore=*.swp,*.bak,*.pyc,*.class

" Character encoding settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251
set fileformats=unix,dos,mac

" PYTHON
" Display tabs at the beginning of a line in Python mode as bad.
autocmd BufRead,BufNewFile *.py,*.pyw,*.pyx match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
autocmd BufRead,BufNewFile *.py,*.pyw*,.pyx,*.c,*.h match BadWhitespace /\s\+$/

" RST and TXT
" Enable spell-check for RST and plain text files
autocmd BufNewFile,BufRead *.{txt,rst} setlocal spell spelllang=en_us
" Make trailing whitespace be flagged as bad for RST files
autocmd BufRead,BufNewFile *.rst match BadWhitespace /\s\+$/
" Trim trailing whitespace on save for RST files
autocmd BufWritePre *.rst :%s/\s\+$//e

" YAML
" treat *.hot OpenStack Orchestration (Heat) templates as YAML
autocmd BufRead,BufNewFile *.hot set filetype=yaml
" set indent settings for yaml files
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
" Make trailing whitespace be flagged as bad for YAML files
autocmd BufRead,BufNewFile *.yaml,*.yml,*.hot match BadWhitespace /\s\+$/
" Trim trailing whitespace on save for YAML files
autocmd BufWritePre *.yaml,*.yml,*.hot :%s/\s\+$//e

" Config files
" treat *.conf files as in dosini format
autocmd BufRead,BufNewFile *.conf set filetype=dosini
